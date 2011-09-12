module Haml::Filters::JSOnload
  include Haml::Filters::Base

  def render_with_options(text, options)
    <<END
<script type="text/javascript">
  //<![CDATA[
    $(function() {
      #{text}
    });
  //]]>
</script>
END
  end
end
