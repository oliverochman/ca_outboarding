# frozen_string_literal: true

Given('(the following users exists)(the following user exists)') do |table|
  table.hashes.each do |member_hash|
    create(:member, member_hash)
  end
end

Given("he has the following projects") do |table|
  table.hashes.each do |project|
    user = User.find_by(email: project[:user])
    project.except!("user")
    create(:resource, project.merge(user: user))
  end
end


Given("he has the following skills listed") do |table|
  table.hashes.each do |skill|
    user = User.find_by(email: skill[:user])
    skill.except!("user")
    create(:skill, skill.merge(user: user))
  end
end

