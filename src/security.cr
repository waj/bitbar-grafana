@[Link(framework: "Security")]
lib SecurityFramework
  fun find_generic_password = SecKeychainFindGenericPassword(keychain : Void*, service_name_len : UInt32, service_name : LibC::Char*, account_name_len : UInt32, account_name : LibC::Char*, password_len : UInt32*, password_data : Void*, item_ref : Void*) : UInt32
end

module Security
  def self.find_generic_password(service_name, account_name)
    password_length = uninitialized UInt32
    password_data = uninitialized Void*
    ret = SecurityFramework.find_generic_password(nil,
      service_name.size, service_name,
      account_name.size, account_name,
      pointerof(password_length), pointerof(password_data), nil)
    if ret != 0
      raise "Could not obtain the requested password"
    end

    String.new(password_data.as(UInt8*), password_length)
  end
end
