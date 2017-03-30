defmodule App.UserInfoTest do
  use App.ModelCase

  alias App.UserInfo

  @valid_attrs %{organisation_cell: "some content", organisation_unit: "some content", section: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = UserInfo.changeset(%UserInfo{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = UserInfo.changeset(%UserInfo{}, @invalid_attrs)
    refute changeset.valid?
  end
end
