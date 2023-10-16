//::///////////////////////////////////////////////
//:: Name q2bn_ent_ogretrg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Have the Ogre High Mage equip a cool weapon
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 19/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
        object oOgre = GetObjectByTag("q2b03ogrehighmage");
        ExecuteScript("x2_act_coolitem", oOgre);
    }
}
