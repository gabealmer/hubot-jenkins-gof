# hubot-jenkins-gof

Jenkins support for GitHub Organization Folder Plugin

See [`src/jenkins-gof.coffee`](src/jenkins-gof.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-jenkins-gof --save`

Then add **hubot-jenkins-gof** to your `external-scripts.json`:

```json
[
  "hubot-jenkins-gof"
]
```

## Sample Interaction

```
user1>> hubot jenkins build org job branch
hubot>> @user1 Build of org/job/branch started!
```

## NPM Module

https://www.npmjs.com/package/hubot-jenkins-gof
