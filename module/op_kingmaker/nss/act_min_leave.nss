//::///////////////////////////////////////////////
//:: Miners Leave
//:: act_min_leave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    NPC walks away and disappears
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    //Miners walk away and destroy self
    object oWay = GetNearestObjectByTag("q3_map_exit");
    object oMiner;
    int nCount;
    for(nCount = 0; nCount < 3; nCount++)
    {
        oMiner = GetObjectByTag("q3_iminers",nCount);
        AssignCommand(oMiner,ActionMoveToObject(oWay));
        AssignCommand(oMiner,ActionDoCommand(DestroyObject(oMiner)));
    }
}
