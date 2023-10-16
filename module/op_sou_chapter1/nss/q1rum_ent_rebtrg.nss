//::///////////////////////////////////////////////
//:: Name  q1rum_ent_rebtrg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If rebecca makes it this far - she has run out
    of the cave and will reappear back at the
    Hurst farmstead.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 21/03
//:://////////////////////////////////////////////

void main()
{
    object oRebecca = GetEnteringObject();
    if (GetTag(oRebecca) == "q1ruralrebecca")
    {
        SetCommandable(TRUE, oRebecca);
        if (GetLocalInt(oRebecca, "nJumpOutsideCave") == 1)
        {
           SetCommandable(TRUE, oRebecca);
           //SendMessageToPC(GetFirstPC(), "Reb in Jump Trigger");

           AssignCommand(oRebecca, JumpToObject(GetWaypointByTag("wp_q1rural_beckapost")));
        }
        else
        {
            DestroyObject(oRebecca);
            location lSpawn = GetLocation(GetWaypointByTag("wp_q1hurst_spnreb"));
            CreateObject(OBJECT_TYPE_CREATURE, "q1ruralrebecca", lSpawn);
        }
    }
}
