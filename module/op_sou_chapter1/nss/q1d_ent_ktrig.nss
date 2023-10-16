//::///////////////////////////////////////////////
//:: Name q1d_ent_ktrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    //kill any kobolds that step on the trigger 'running' for the door
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 11/03
//:://////////////////////////////////////////////

void main()
{
    object oKobold = GetEnteringObject();
    //kill any kobolds that step on the trigger 'running' for the door
    if (GetTag(oKobold) == "q1dk_shaman" || GetTag(oKobold) == "q1dk_footpad1" || GetTag(oKobold) == "q1dk_footpad2" || GetTag(oKobold) == "q1dk_footpad3" || GetTag(oKobold) == "q1dk_footpad4" || GetTag(oKobold) == "q1dcook" || GetTag(oKobold) == "q1d_oldman")
    {

        if (GetTag(oKobold) != "q1d_oldman")
        {
            SignalEvent(oKobold, EventUserDefined(1100));
            object oSound1 = GetObjectByTag("snd_q1dscream");
            object oSound2 = GetObjectByTag("snd_q1dyells");
            object oSound3 = GetObjectByTag("snd_q1dmob");
            SoundObjectStop(oSound1);
            SoundObjectStop(oSound2);
            SoundObjectStop(oSound3);
            DestroyObject(oSound1);
            DestroyObject(oSound2);
            DestroyObject(oSound3);

            if (GetTag(oKobold) == "q1dcook")
            {
                //Spawn in Dead Mara
                SetLocalInt(GetModule(), "Captive_Cook", 1);

                location lCook = GetLocation(GetWaypointByTag("wp_q1d_deadcook"));
                CreateObject(OBJECT_TYPE_CREATURE, "q1dcook", lCook);
            }
            //variable set if hulc gets out
            if (GetTag(oKobold) == "q1dk_shaman")
            {
                SetLocalInt(GetModule(), "q5_Hurc_Alive", 1);
                //Spawn Herc into the Kobold Chief's area
                location lSpawn = GetLocation(GetWaypointByTag("wp_q5_hurc_spn"));
                CreateObject(OBJECT_TYPE_CREATURE, "q5_hurc", lSpawn);
            }
        }
        DestroyObject(oKobold, 0.2);

    }

}
