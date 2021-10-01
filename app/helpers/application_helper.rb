module ApplicationHelper
  def user_login_password
    a = '2230959583'

    a
  end

  def icon(icon_text)
    content_tag(:i, "", class:"#{icon_text}")
  end

  def join_group(group, transaction)
    (link_to "add to group", new_group_transaction_path(@group_transaction, group_id: group.id, user_transaction_id:transaction.id), class:"button is-success",method: :post).html_safe
  end

  def first_transaction_icon(id)
    UserTransaction.find(id).groups.pluck(:icon).last
  end

  def transaction_already_in_group(group, transaction)
    a = GroupTransaction.where('group_id =? AND user_transaction_id =?', group.id, transaction.id).pluck(:group_id)
    a.include?(group.id) ? true : false
  end
end
