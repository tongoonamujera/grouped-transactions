module ApplicationHelper
  def user_login_password
    a = '2230959583'

    a
  end

  def icon(icon_text)
    content_tag(:i, "", class:"#{icon_text}")
  end

  def profile_icon
    content_tag(:i, "", class:"far fa-user-circle fa-3x")
  end

  def login_icon
    content_tag(:i, "", class:"fas fa-sign-in-alt fa-2x")
  end

  def join_group(group, transaction)
    (link_to "add to group", new_group_transaction_path(@group_transaction, group_id: group.id, user_transaction_id:transaction.id), class:"button is-success",method: :post).html_safe
  end

  def first_transaction_icon(id)
    UserTransaction.find(id).groups.order(created_at: :desc).pluck(:icon).last
  end

  def transaction_already_in_group(group, transaction)
    a = GroupTransaction.where('group_id =? AND user_transaction_id =?', group.id, transaction.id).pluck(:group_id)
    a.include?(group.id) ? true : false
  end

  def group_transactions_total(group)
    a = Group.find(group.id).user_transactions.pluck(:amount).inject(:+)
    a.nil? ? a = 0 : a
  end

  def user_total_transactions
    a = current_user.user_transactions.pluck(:amount).inject(:+)
    a.nil? ? a = 0 : a
  end

  def user_total_external_transactions
    a = current_user.user_transactions.pluck(:id)
    b = GroupTransaction.where("user_transaction_id IN (?)", a).pluck(:user_transaction_id).uniq!
    c = current_user.user_transactions.where.not("id IN (?)", b).pluck(:amount).inject(:+)
    c.nil? ? c = 0 : c
  end
end
