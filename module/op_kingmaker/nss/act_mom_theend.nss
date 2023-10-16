//::///////////////////////////////////////////////
//:: act_mom_theend
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    MommaJi releases your henchmen from their bindings
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oCal = GetNearestObjectByTag("os_hen_cal");
    object oKai = GetNearestObjectByTag("os_hen_kai");
    object oTrp = GetNearestObjectByTag("os_hen_trp");
    object oJab = GetNearestObjectByTag("os_hen_jab");
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
}
