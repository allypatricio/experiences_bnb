module ExperiencesHelper

  def group_cards_experiences(group)
    html = ''

    group.each_with_index do |experience, index|
      css_class = index < 2 ? 'col-md-6' : 'col-md-4'

      html << content_tag(:div, class: css_class) do
        render 'shared/card', experience: experience
      end
    end

    html.html_safe
  end
end
