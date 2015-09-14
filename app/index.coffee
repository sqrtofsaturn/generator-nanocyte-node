yeoman = require 'yeoman-generator'
yosay  = require 'yosay'
_      = require 'lodash'

NanocyteNodeGenerator = yeoman.generators.Base.extend
  constructor: ->
    yeoman.generators.Base.apply this, arguments
    @option 'coffee'

  initializing: ->
    @pkg = require '../package.json'

  prompting: ->
    done = @async()

    @log yosay 'Welcome to the Nanocyte Node Generator!'

    prompts = [{
      name: 'safety-dance'
      message: 'This will create the nanocyte-node in the CURRENT DIRECTORY!\n\tPress ctrl+c to quit now, press enter to continue'
    },{
      type: 'input'
      name: 'nanocyteName'
      message: 'What is the name of your Nanocyte node?'
      default : _.kebabCase @appname
    }];

    @prompt prompts, (props) =>
      @nanocyteName = 'nanocyte-node-' + props.nanocyteName
      @className = _.capitalize(props.nanocyteName) + 'Node'
      @nodeSrc = props.nanocyteName + '-node'
      done()

  configuring:
    enforceFolderName: ->
      @config.save()

  writing:
    app: ->
      if @options.coffee
        @template '_package.coffee.json', 'package.json'
        @template '_index.coffee.js', 'index.js'
        @template 'src/node.coffee', 'src/' + @nodeSrc + '.coffee'
        @template 'test/test_template.coffee', 'test/' + @nodeSrc + '-spec.coffee'
        @copy 'test/mocha.opts', 'test/mocha.opts'
        @copy 'test/test_helper.coffee', 'test/test_helper.coffee'
        @copy 'examples/sample-node.coffee', 'examples/sample-node.coffee'
#        @copy '_gitignore_coffee', '.gitignore'
      else
        @template '_package.json', 'package.json'
        @template '_index.js', 'index.js'
#        @copy '_gitignore', '.gitignore'

  end: ->
    @installDependencies bower: false

module.exports = NanocyteNodeGenerator
