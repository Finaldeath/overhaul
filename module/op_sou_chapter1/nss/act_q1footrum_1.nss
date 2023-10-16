//::///////////////////////////////////////////////
//:: Name act_q1footrum_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Rumgut will pass out after the drinking contest.
    He will also drop the key to the cage..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 21/03
//:://////////////////////////////////////////////

void main()
{
    //Drop key and create new one..
    //object oKey = GetItemPossessedBy(OBJECT_SELF, "q1rumgutkey");
    //DestroyObject(oKey);
    //location lKey = GetLocation(GetWaypointByTag("wp_q1rumgut_keydrop"));
    //CreateObject(OBJECT_TYPE_ITEM, "q1rumgutkey", lKey);
    //Knock out rumgut..
    object oRumgut = GetObjectByTag("q1foot_rumgut");
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSleep(), oRumgut, 600.0);
    SetLocalInt(oRumgut, "X1_RumgutDrunk", 1);
    DelayCommand(600.0, SetLocalInt(oRumgut, "X1_RumgutDrunk", 0));

}
