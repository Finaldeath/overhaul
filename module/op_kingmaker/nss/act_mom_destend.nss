//::///////////////////////////////////////////////
//:: act_mom_destend
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    MommaJi flees
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////
void main()
{
    object oCal = GetNearestObjectByTag("os_hen_cal");
    object oKai = GetNearestObjectByTag("os_hen_kai");
    object oTrp = GetNearestObjectByTag("os_hen_trp");
    object oJab = GetNearestObjectByTag("os_hen_jab");
    object oPC = GetFirstPC();
    object oWay = GetObjectByTag("q2_way_tpc");
    if(GetIsObjectValid(oCal))
    {
        effect eEff1 = GetFirstEffect(oCal) ;
        while (GetIsEffectValid(eEff1))
        {
            RemoveEffect(oCal,eEff1);
            eEff1 = GetNextEffect(oCal);
        }
    }
    if(GetIsObjectValid(oKai))
    {
        effect eEff2 = GetFirstEffect(oKai) ;
        while (GetIsEffectValid(eEff2))
        {
            RemoveEffect(oKai,eEff2);
            eEff2 = GetNextEffect(oKai);
        }
    }
    if(GetIsObjectValid(oTrp))
    {
        effect eEff3 = GetFirstEffect(oTrp) ;
        while (GetIsEffectValid(eEff3))
        {
            RemoveEffect(oTrp,eEff3);
            eEff3 = GetNextEffect(oTrp);
        }
    }
    if(GetIsObjectValid(oJab))
    {
        effect eEff4 = GetFirstEffect(oJab) ;
        while (GetIsEffectValid(eEff4))
        {
            RemoveEffect(oJab,eEff4);
            eEff4 = GetNextEffect(oJab);
        }
    }
//    ActionSpeakString("THE END!");
    AssignCommand(oPC,ActionJumpToObject(oWay));
    ActionDoCommand(DestroyObject(OBJECT_SELF));
}
