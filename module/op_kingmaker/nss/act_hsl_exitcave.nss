//::///////////////////////////////////////////////
//:: Slaves Exit
//:: act_hsl_exitcave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The slaves run away
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oWay = GetNearestObjectByTag("q3_map_exit");
    object oSlave;
    int nCount;
    effect eGhost = EffectCutsceneGhost();

    for(nCount = 0; nCount < 4; nCount++)
    {
        oSlave = GetObjectByTag("q3_hslave1", nCount);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eGhost, oSlave, 20.0f);
        AssignCommand(oSlave,ActionForceMoveToObject(oWay,TRUE,1.0,15.0));
        AssignCommand(oSlave,ActionDoCommand(DestroyObject(OBJECT_SELF)));
    }

    ActionForceMoveToObject(oWay, TRUE, 1.0f, 15.0f);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eGhost, OBJECT_SELF, 20.0f);
}
