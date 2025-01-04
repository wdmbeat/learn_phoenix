defmodule LearnPhoenix.ExperimentsTest do
  use LearnPhoenix.DataCase

  alias LearnPhoenix.Experiments

  describe "workloads" do
    alias LearnPhoenix.Experiments.Workload

    import LearnPhoenix.ExperimentsFixtures

    @invalid_attrs %{name: nil}

    test "list_workloads/0 returns all workloads" do
      workload = workload_fixture()
      assert Experiments.list_workloads() == [workload]
    end

    test "get_workload!/1 returns the workload with given id" do
      workload = workload_fixture()
      assert Experiments.get_workload!(workload.id) == workload
    end

    test "create_workload/1 with valid data creates a workload" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Workload{} = workload} = Experiments.create_workload(valid_attrs)
      assert workload.name == "some name"
    end

    test "create_workload/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Experiments.create_workload(@invalid_attrs)
    end

    test "update_workload/2 with valid data updates the workload" do
      workload = workload_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Workload{} = workload} = Experiments.update_workload(workload, update_attrs)
      assert workload.name == "some updated name"
    end

    test "update_workload/2 with invalid data returns error changeset" do
      workload = workload_fixture()
      assert {:error, %Ecto.Changeset{}} = Experiments.update_workload(workload, @invalid_attrs)
      assert workload == Experiments.get_workload!(workload.id)
    end

    test "delete_workload/1 deletes the workload" do
      workload = workload_fixture()
      assert {:ok, %Workload{}} = Experiments.delete_workload(workload)
      assert_raise Ecto.NoResultsError, fn -> Experiments.get_workload!(workload.id) end
    end

    test "change_workload/1 returns a workload changeset" do
      workload = workload_fixture()
      assert %Ecto.Changeset{} = Experiments.change_workload(workload)
    end
  end
end
