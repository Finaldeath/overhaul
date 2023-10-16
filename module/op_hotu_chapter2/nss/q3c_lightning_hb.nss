//::///////////////////////////////////////////////
//:: Lightning Pillar heartbeat file
//:: q3c_lightning_hb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The file acts as the heartbeat event for the Lightning Pillar puzzle. Every heartbeat a lightning
     bolt is fired that might hurt nearby creatures. Also, if a charged orb is placed in one of the
     surrounding pillars, the lightning bolt will arc towards it and will jump to the next pillar, door
     or creature.
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 22/1/2003
//:://////////////////////////////////////////////

#include "NW_I0_SPELLS"
#include "nw_i0_plot"

// Fires a lightning bolt from oSource to oTarget
void FireBeam(object oSource, object oTarget);

// Finds the closest target for the lightning bolt, either a ground target or a creature and fires the bolt
void FireBeamAtClosest(object oSource);

// checks whether the object sTag has a charged orb in its inventory.
int HasChargedOrb(string sTag);

// unlocks and open the door
void OpenLightningDoor(object oDoor);

void main()
{
    if(GetLocalInt(OBJECT_SELF, "STOP_BEAM") == 1)
        return;
    // the following 3 doors can only be opened by a directed lightning bolt.
    object oDoor1 = GetNearestObjectByTag("ElectricDoor1");
    object oDoor2 = GetNearestObjectByTag("ElectricDoor2");
    object oDoor3 = GetNearestObjectByTag("ElectricDoor3");

    // now checking whether a pillar has an orb and if so -  then targeting it for the bolt.

    // first checking if the 1-pillar path has an orb.
    if(HasChargedOrb("ElectricPedestal1A"))
    {
        FireBeam(OBJECT_SELF, GetNearestObjectByTag("ElectricPedestal1A"));
        if(!GetIsOpen(oDoor1)) // and open the door in front of it
        {
            FireBeam(GetNearestObjectByTag("ElectricPedestal1A"), oDoor1);
            OpenLightningDoor(oDoor1);
        }
        else // the door has already been opened - then target the nearest creature or ground
            FireBeamAtClosest(GetNearestObjectByTag("ElectricPedestal1A"));
    }
    // now checking to see if the 2-pillar path is full
    else if(HasChargedOrb("ElectricPedestal2A"))
    {
        FireBeam(OBJECT_SELF, GetNearestObjectByTag("ElectricPedestal2A"));
        if(HasChargedOrb("ElectricPedestal2B"))
        {
            FireBeam(GetNearestObjectByTag("ElectricPedestal2A"), GetNearestObjectByTag("ElectricPedestal2B"));
            if(!GetIsOpen(oDoor2))
            {
                FireBeam(GetNearestObjectByTag("ElectricPedestal2B"), oDoor2);
                OpenLightningDoor(oDoor2);
            }
            else
                FireBeamAtClosest(GetNearestObjectByTag("ElectricPedestal2B"));
        }
        else
            FireBeamAtClosest(GetNearestObjectByTag("ElectricPedestal2A"));
    }
    // and finally, checking whether the 3-pillar path is full
    else if(HasChargedOrb("ElectricPedestal3A"))
    {
        FireBeam(OBJECT_SELF, GetNearestObjectByTag("ElectricPedestal3A"));
        if(HasChargedOrb("ElectricPedestal3B"))
        {
            FireBeam(GetNearestObjectByTag("ElectricPedestal3A"), GetNearestObjectByTag("ElectricPedestal3B"));
            if(HasChargedOrb("ElectricPedestal3C"))
            {
                FireBeam(GetNearestObjectByTag("ElectricPedestal3B"), GetNearestObjectByTag("ElectricPedestal3C"));
                if(!GetIsOpen(oDoor3))
                {
                    FireBeam(GetNearestObjectByTag("ElectricPedestal3C"), oDoor3);
                    OpenLightningDoor(oDoor3);
                }
                else
                    FireBeamAtClosest(GetNearestObjectByTag("ElectricPedestal3C"));
            }
            else
                FireBeamAtClosest(GetNearestObjectByTag("ElectricPedestal3B"));
        }
        else
            FireBeamAtClosest(GetNearestObjectByTag("ElectricPedestal3A"));
    }
    else // look for the player...
        FireBeamAtClosest(OBJECT_SELF);
}

// checks whether the object sTag has a charged orb in its inventory.
int HasChargedOrb(string sTag)
{
    object oPedestal = GetObjectByTag(sTag);
    if(oPedestal == OBJECT_INVALID || GetItemPossessedBy(oPedestal, "Q3C_ChargedOrb") == OBJECT_INVALID)
        return 0;
    return 1;
}

// Fires a lightning bolt from oSource to oTarget
void FireBeam(object oSource, object oTarget)
{
    if(oSource == OBJECT_INVALID || oTarget == OBJECT_INVALID)
        return;
    int nSaveDC = 22;
    int nDamageMaster = d4(8);
    // if its an iron golem - then fry it for double damage
    if(GetTag(oTarget) == "NW_GOLIRON")
        nDamageMaster *= 2;
    PlaySound("as_wt_thundercl2");
    effect eLightning = EffectBeam(VFX_BEAM_LIGHTNING, oSource, BODY_NODE_CHEST);
    int nDamage = nDamageMaster;
    effect eDam;
    effect eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_S);
    location lTarget = GetLocation(oTarget);

    //Adjust the trap damage based on the feats of the target
    if(!MySavingThrow(SAVING_THROW_REFLEX, oTarget, nSaveDC, SAVING_THROW_TYPE_ELECTRICITY))
    {
        if (GetHasFeat(FEAT_IMPROVED_EVASION, oTarget))
        {
            nDamage /= 2;
        }
    }
    else if (GetHasFeat(FEAT_EVASION, oTarget) || GetHasFeat(FEAT_IMPROVED_EVASION, oTarget))
    {
        nDamage = 0;
    }
    else
    {
        nDamage /= 2;
    }
    if (nDamage > 0)
    {
        eDam = EffectDamage(nDamage, DAMAGE_TYPE_ELECTRICAL);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    }
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLightning, oTarget, 0.75);
}

// Finds the closest target for the lightning bolt, either a ground target or a creature and fires the bolt
void FireBeamAtClosest(object oSource)
{
    object oCreature = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_ALL, OBJECT_SELF);
    if(GetDistanceBetween(oSource, oCreature) <= 15.0)
        FireBeam(oSource, oCreature); // got a nearby creature to fry!
    else // no one nearby - hit the ground
    {
        object oTarget;
        if(oSource == OBJECT_SELF)
            oTarget =  GetNearestObjectByTag("LightningTarget", oCreature);
        else
            oTarget = GetNearestObjectByTag("LightningTarget", oSource);
        FireBeam(oSource, oTarget);
    }
}

void OpenLightningDoor(object oDoor)
{
    if(GetTag(oDoor) == "ElectricDoor3")
    {
        Reward_2daXP(GetFirstPC(), 22);
        SetLocalInt(OBJECT_SELF, "STOP_BEAM", 1);
    }
    effect eBump = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eBump, oDoor);
    effect eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_M);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oDoor);
    SetLocked(oDoor, FALSE);
    AssignCommand(oDoor, ActionOpenDoor(oDoor));
}
