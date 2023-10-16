//::///////////////////////////////////////////////
//:: Witchwork: Ethereal Filcher Killer
//:: WW_FilcherKiller.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Kills any Ethereal Filcher that enters the
     trigger. This prevents them from accosting
     players while they're interacting with the
     Night Hag.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 5, 2002
//:://////////////////////////////////////////////

void main()
{
    object oEnterer = GetEnteringObject();
    string sTag = GetTag(oEnterer);
    effect eKill = EffectDamage(GetMaxHitPoints(oEnterer));

    if (sTag == "EtherealFilcher")
    {
        AssignCommand(oEnterer, ClearAllActions());
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eKill, oEnterer);
    }
}
