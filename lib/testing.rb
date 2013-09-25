# Person
#
# @author julio.antunez.tarin@gmail.com
class Person
  include ActiveAttr::Attributes

  attribute :first_name
  attribute :second_name
end

# City
#
# @author julio.antunez.tarin@gmail.com
class City
  include ActiveAttr::AttributeDefaults

  attribute :name,   default: 'Valencia'
  attribute :region, default: 'Levante'
end

# Region
#
# @author julio.antunez.tarin@gmail.com
class Region
  include ActiveAttr::QueryAttributes

  attribute :name
  attribute :area
end

# Area
#
# @author julio.antunez.tarin@gmail.com
class Area
  include ActiveAttr::TypecastedAttributes

  attribute :name
  attribute :province
  attribute :code, type: Integer
end

# Province
#
# @author julio.antunez.tarin@gmail.com
class Province
  include ActiveAttr::BlockInitialization

  attr_accessor :name, :country
end

# Country
#
# @author julio.antunez.tarin@gmail.com
class Country
  include ActiveAttr::Logger
end

# Phone
#
# @author julio.antunez.tarin@gmail.com
class Phone
  include ActiveAttr::BasicModel
end

# Smartphone
#
# @author julio.antunez.tarin@gmail.com
class Smartphone
  include ActiveAttr::MassAssignment

  attr_accessor :model, :sn
end

# Tablet
#
# @author julio.antunez.tarin@gmail.com
class Tablet
  include ActiveAttr::MassAssignment
  include ActiveModel::MassAssignmentSecurity

  attr_accessor :model, :sn
  attr_protected :price
end

# Desktop
#
# @author julio.antunez.tarin@gmail.com
class Desktop
  include ActiveAttr::MassAssignment
  include ActiveModel::MassAssignmentSecurity
  include ActiveModel::ForbiddenAttributesProtection

  attr_accessor :model, :sn
  attr_protected :price
end

# Laptop
#
# @author julio.antunez.tarin@gmail.com
class Laptop
  include ActiveAttr::Serialization

  attribute :model
end

# Keyboard
#
# @author julio.antunez.tarin@gmail.com
class Keyboard
  include ActiveAttr::Model

  attribute :model, default: 'KB4EV'
  attribute :brand
  attribute :country
end

