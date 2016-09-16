# Description
#   Jenkins support for GitHub Organization Folder Plugin
#
# Configuration:
#   HUBOT_JENKINS_URL
#   HUBOT_JENKINS_AUTH
#
# Commands:
#   hubot jenkins build <org> <job> <branch> - builds the specified job's branch in the organization
#   hubot jenkins rescan <org> - re-scans the given organization
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   gabealmer@gmail.com

module.exports = (robot) ->
  robot.respond /jenkins build (.*) (.*) (.*)/, (msg) ->
    [_, org, job, branch] = msg.match
    jenkinsUrl = "#{process.env.HUBOT_JENKINS_URL}/job/#{org}/job/#{job}/job/#{branch}/build?delay=0sec"
    auth = new Buffer(process.env.HUBOT_JENKINS_AUTH).toString('base64')

    robot.http(jenkinsUrl)
      .header('Authorization', "Basic #{auth}")
      .post({}) (err, res, body) ->
        if err
          msg.send "Error #{err}"
        else
          msg.reply "Build of #{org}/#{job}/#{branch} started!"

  robot.respond /jenkins rescan (.*)/, (msg) ->
    org = msg.match[1]
    jenkinsUrl = "#{process.env.HUBOT_JENKINS_URL}/job/#{org}/build?delay=0sec"
    auth = new Buffer(process.env.HUBOT_JENKINS_AUTH).toString('base64')

    robot.http(jenkinsUrl)
      .header('Authorization', "Basic #{auth}")
      .post({}) (err, res, body) ->
        if err
          msg.send "Error #{err}"
          return
        else
          msg.reply "Re-scan started!"
