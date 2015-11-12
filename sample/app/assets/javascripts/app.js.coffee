jQuery(document).on 'ready page:load', ->
  jQuery('.btn-search').on 'click', ->
    console.log ' btn-search clicked'
    $this = jQuery(this)
    $q = jQuery('#q')
    q = $q.val()
    console.log $this.data('search-type')
    if q
      type = $this.data('search-type') || 'standard'
      search(q, type)
    else
      alert('搜索内容不能为空')

    false

  search = (q, type) ->
    window.location.href="/courses/#{type}_search?q=" + q
