//lib04a_ent_trig
//Spawn in the succubi with the special treasure
//when entered
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE && GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
        location lTarget = GetLocation(GetWaypointByTag("wp_lib04a_succubi"));
        CreateObject(OBJECT_TYPE_CREATURE, "lib04a_succubi", lTarget, TRUE);
    }


}
