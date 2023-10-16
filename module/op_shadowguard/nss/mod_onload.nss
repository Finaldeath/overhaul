void main()
{
    // SetLocalInt(GetModule(), "N_TEST", 1); // Set to 1 for Testing purposes
    SetLocalInt(GetModule(), "N_TESTING_HENCH", 1);

    // Set values for use later in the module
    SetLocalInt(GetModule(), "N_COMM_MAX_RAND", 6); // used for randomizing Commoner talk levels
    SetLocalInt(GetModule(), "N_MAX_HENCH_LVL", 5); // MAX level a Henchman can achieve
    //SetLocalInt(GetModule(), "N_ST_2_QUESTS_IMPLEMENTED", 0);

    // Destroy any Test Chests if not testing
    if (GetLocalInt(GetModule(), "N_TEST") != 1)
    {
        int i;
        object o;

        do
        {
            o = GetObjectByTag("TEST_CHEST", i);
            i++;
        }
        while (o != OBJECT_INVALID);
    }
}
