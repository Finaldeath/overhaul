//::///////////////////////////////////////////////
//:: Name q1b_endcon_nora
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        End of conversation - Nora will move to her
        waypoint
*/
//:://////////////////////////////////////////////
//:: Created By: Keith WArner
//:: Created On: Feb 10/03
//:://////////////////////////////////////////////

void main()
{
    if (GetTag(GetArea(OBJECT_SELF)) == "q1bhilltopeast")
        AssignCommand(OBJECT_SELF, ActionMoveToObject(GetWaypointByTag("wp_q1bnora1")));
    if (GetLocalInt(GetModule(),"X1_NORAHASBABY") == 1)
    {
        object oBaby = GetObjectByTag("q1hbaby");
        int nCount;
        for (nCount = 1; nCount < 5; nCount++)
        {
            if (GetIsObjectValid(oBaby) == TRUE)
            {
                DestroyObject(oBaby);
                oBaby = GetObjectByTag("q1hbaby");
            }
        }
        //Make sure there's no baby in the cradle
        object oCradle = GetObjectByTag("q1hcradle");
        object oCradleBabe = GetItemPossessedBy(oCradle, "q1hbaby");
        if (GetIsObjectValid(oCradleBabe) == TRUE)
            DestroyObject(oCradleBabe);
    }
}
