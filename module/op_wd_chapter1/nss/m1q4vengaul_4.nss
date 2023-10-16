//::///////////////////////////////////////////////
//::
//:: Attacked
//::
//:: M1Q4Vengaul_4.nss
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: If Vengaul is attacked he drops the cockatrice
//:: and runs away.
//::
//::
//:://////////////////////////////////////////////
//::
//:: Created By: John
//:: Created On: September 14, 2001
//::
//:://////////////////////////////////////////////

void main()
{
    if(!GetIsObjectValid(GetLocalObject(GetArea(OBJECT_SELF),"MW_G_M1Q4DCock")))
    {
        object oAttacker = GetLastAttacker(OBJECT_SELF);

        AdjustReputation(oAttacker,OBJECT_SELF,-100);
        ActionSpeakString("NW_CALL_TO_ARMS",TALKVOLUME_SILENT_SHOUT);
        //object oCock = CreateObject(OBJECT_TYPE_CREATURE,"M1Q4DCOCKATRICE",GetLocation(OBJECT_SELF));
        //SetLocalObject(GetArea(OBJECT_SELF),"MW_G_M1Q4DCock",oCock);
        //AssignCommand(oCock,ActionAttack(oAttacker));
        ActionMoveToObject(GetWaypointByTag("WP_M1Q4D_M1Q4A"),TRUE);
        ActionDoCommand(DestroyObject(OBJECT_SELF));
        SetLocked(GetNearestObjectByTag("M1Q4CockBox"),FALSE);
    }
}
