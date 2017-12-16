class Order < ApplicationRecord

  NEW = 'new'.freeze
  SUBMITTED = 'submitted'.freeze

  STATUSES = [NEW, SUBMITTED]

  has_many :order_items
  belongs_to :user
  before_validation :update_subtotal
  before_validation :set_status

  scope :new_orders, -> do
    where(status: NEW)
  end

  scope :submitted, -> do
    where(status: SUBMITTED)
  end

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def new?
    status == NEW || status.blank?
  end

  def submitted?
    status == SUBMITTED
  end

  def submit
    self.status = SUBMITTED
    self.save
  end

  def submit!
    self.status = SUBMITTED
    self.save!
  end

  private

  def set_status
    self.status ||= NEW
  end

  def update_subtotal
    self.subtotal = subtotal
  end
end
