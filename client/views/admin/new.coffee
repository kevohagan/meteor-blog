Template.blogAdminNew.rendered = ->
<<<<<<< HEAD
=======
  $('.post-form').parsley()
>>>>>>> new
  $('[name=title]').focus().val ''

  @editor = ace.edit 'editor'
  @editor.setTheme 'ace/theme/chrome'
  @editor.setFontSize 14
  @editor.renderer.setShowPrintMargin false
  @editor.renderer.setShowGutter false
  @editor.setHighlightActiveLine true
  @editor.getSession().setMode 'ace/mode/markdown'
  @editor.getSession().setUseWrapMode true

  @editor.on 'change', _.debounce((e) =>
    height = @editor.getSession().getDocument().getLength() * @editor.renderer.lineHeight + @editor.renderer.scrollBar.getWidth()
    $('#editor, #preview').height height
    @editor.resize()
  , 250)

<<<<<<< HEAD
  $label = $('.body-label')
  $switch = $('.make-switch')
  $editor = $('#editor')
  $preview = $('#preview')
  $document = $(document)

  $switch.bootstrapSwitch().on 'switch-change', (e, data) =>
    if data.value
      $editor.hide()
      val = marked @editor.getValue()
      $label.text 'Preview'
      return $preview.html(val).show()

    $editor.show()
    @editor.focus()
    $label.text 'Body'
    $preview.hide()

  # Logic for the keyboard preview shortcut: some browsers work on 'keyup', and
  # some on 'keydown', and some on both, but we don't want to toggle it twice so
  # we have these guard variables. Also, use Apple key on Mac, and Ctrl key
  # otherwise.

  justpressed = justtoggled = false
  isMac = (window.navigator.platform.toLowerCase().indexOf('mac') >= 0)
  ctrl = if isMac then 'metaKey' else 'ctrlKey'
  if isMac
    $('.ctrl-label').html '&#8984;'

  $document.on 'keyup', (e) ->
    if justpressed and not justtoggled and e[ctrl] and e.which is 80
      e.preventDefault()
      $switch.bootstrapSwitch 'toggleState'
    justpressed = justtoggled = false

  $document.on 'keydown', (e) ->
    justpressed = true
    if e[ctrl] and e.which is 80
      e.preventDefault()
      $switch.bootstrapSwitch 'toggleState'
      justtoggled = true
=======
  $('.make-switch').bootstrapSwitch().on 'switch-change', (e, data) =>
    if data.value
      $('#editor').hide()
      val = marked @editor.getValue()
      return $('#preview').html(val).show()

    $('#editor').show()
    @editor.focus()
    $('#preview').hide()
>>>>>>> new

flash = (status, post) ->
  setTimeout ->
    $('.status').hide().html(status).fadeIn 'slow', ->
      setTimeout ->
        Router.go "blogAdminEdit", slug: post.slug
      , 2500
  , 100

Template.blogAdminNew.events

  'click .for-publishing': (e, tpl) ->
    e.preventDefault()

<<<<<<< HEAD
=======
    if not $('.post-form').parsley 'validate'
      return

>>>>>>> new
    post = Post.create
      title: $('[name=title]').val()
      body: tpl.editor.getValue()
      published: true
      createdAt: new Date()
      updatedAt: new Date()
      publishedAt: new Date()
      userId: Meteor.userId()

<<<<<<< HEAD
    if post.errors
      return alert(_(post.errors[0]).values()[0])

=======
>>>>>>> new
    flash 'Publishing...', post

  'click .for-saving': (e, tpl) ->
    e.preventDefault()

<<<<<<< HEAD
=======
    if not $('.post-form').parsley 'validate'
      return

>>>>>>> new
    post = Post.create
      title: $('[name=title]').val()
      body: tpl.editor.getValue()
      published: false
      createdAt: new Date()
      updatedAt: new Date()
      userId: Meteor.userId()

<<<<<<< HEAD
    if post.errors
      return alert(_(post.errors[0]).values()[0])

=======
>>>>>>> new
    flash 'Saving...', post
