//Spawn in Bethsheva's mate if that quest is done.
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nSpawned") != 1)
    {
        if (GetLocalInt(GetModule(), "q1b_Bethsheva_Secret") == 2)
        {
            location lSpawn = GetLocation(GetWaypointByTag("wp_q1c_bethmate"));
            CreateObject(OBJECT_TYPE_CREATURE, "q1cbethmate", lSpawn);
            SetLocalInt(OBJECT_SELF, "nSpawned", 1);
        }
    }

}
