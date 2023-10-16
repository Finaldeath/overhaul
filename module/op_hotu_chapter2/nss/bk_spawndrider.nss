//::///////////////////////////////////////////////
//:: bk_spawndrider
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawns tag# of driders at bk_drider_#
    waypoint
    Keytag is the creature blueprint
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    object oEnter = GetEnteringObject();
    if (GetIsPC(oEnter) == FALSE || GetLocalInt(OBJECT_SELF, "Triggered") == TRUE)
        return;

    SetLocalInt(OBJECT_SELF, "Triggered", TRUE);

    int nNum = StringToInt(GetTag(OBJECT_SELF));
    int i = 0;
    object oWay;
    object oDrider;
    string sTag = GetLockKeyTag(OBJECT_SELF);

    for (i=1; i<= nNum; i++)
    {
        oWay = GetNearestObjectByTag("bk_drider_" + IntToString(i));
        if (GetIsObjectValid(oWay) == TRUE)
        {
            oDrider =CreateObject(OBJECT_TYPE_CREATURE, sTag, GetLocation(oWay), TRUE);
            // * first drider casts darkness
            if (i == 1 && sTag == "bk_drider")
            {
                DelayCommand(5.0, AssignCommand(oDrider, ClearAllActions()));
                DelayCommand(5.1, AssignCommand(oDrider, ActionCastSpellAtLocation(SPELL_DARKNESS, GetLocation(oEnter), METAMAGIC_QUICKEN, TRUE)));
            }
            else
            if (i == 2 && sTag == "bk_drider")
            {
                DelayCommand(5.0, AssignCommand(oDrider, ClearAllActions()));
                DelayCommand(5.1, AssignCommand(oDrider, ActionCastSpellAtObject(SPELL_WEB, oEnter, METAMAGIC_ANY, TRUE)));
            }

            // * second drider casts web



        }
    }
}
