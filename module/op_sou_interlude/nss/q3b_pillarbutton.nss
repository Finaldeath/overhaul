// portal puzzle button:
// if this is the right button:
// - update puzzle status (increase count by one)
// - light another obelisk in the portal
// - if this is the last one: create the portal
// if this is NOT the right button:
// - init the puzzle
// - remove effects from obelisks (if any)

void RemoveEffects(object oObject)
{
    effect eEff = GetFirstEffect(oObject);
    while(GetIsEffectValid(eEff))
    {
        RemoveEffect(oObject, eEff);
        eEff = GetNextEffect(oObject);
    }
}

void main()
{
    object oPC = GetLastUsedBy();
    // play animation
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    // if Drogan has not yet started casting his spells then nothing would happen
    object oDrogan = GetNearestObjectByTag("Q3B_DROGAN");
    if(oDrogan == OBJECT_INVALID || GetLocalInt(oDrogan, "DIALOG_STATUS") < 2)
    {
        DelayCommand(1.0, FloatingTextStrRefOnCreature(76457, oPC));
        return;
    }

    // get the puzzle status
    int nStatus = GetLocalInt(GetArea(OBJECT_SELF), "Q3B_PORTAL_STATUS");
    if(nStatus == 6)
        return; // puzzle is complete
    // get the button number (postfix side of tag)
    string sMyNumber = GetStringRight(GetTag(OBJECT_SELF), 1);
    int nMyNumber = StringToInt(sMyNumber);
    if(nMyNumber == nStatus + 1) // if this is the CORRECT button
    {
        DelayCommand(1.0, FloatingTextStrRefOnCreature(76456, oPC));
        nStatus++; // update puzzle status
        SetLocalInt(GetArea(OBJECT_SELF), "Q3B_PORTAL_STATUS", nStatus);
        // light an obelisk with the same number
        object oObelisk = GetNearestObjectByTag("Q3B_PORTAL_PILLAR" + sMyNumber);
        effect eVis = EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oObelisk);
        if(nStatus == 6) // the last button -> create portal
        {
            int i;
            object oSource;
            object oTarget;
            int nSource;
            int nTarget;
            effect eBeam;
            // award XP for puzzle
            object oPC = GetFirstPC();
            while(oPC != OBJECT_INVALID)
            {
                GiveXPToCreature(oPC, 500);
                oPC = GetNextPC();
            }
            for (i = 1; i <= 6; i++)
            {


                nSource = i;
                if(i < 6)
                    nTarget = i + 1;
                else
                    nTarget = 1; // a cycle
                oSource = GetNearestObjectByTag("Q3B_PORTAL_PILLAR" + IntToString(nSource));
                oSource = GetNearestObjectByTag("Q3B_INV_PORTAL", oSource);
                oTarget = GetNearestObjectByTag("Q3B_PORTAL_PILLAR" + IntToString(nTarget));
                oTarget = GetNearestObjectByTag("Q3B_INV_PORTAL", oTarget);
                eBeam  = EffectBeam(VFX_BEAM_LIGHTNING, oSource, BODY_NODE_HAND);
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam, oTarget);
            }
            object oWP = GetWaypointByTag("Q3B_WP_SAND_PORTAL");
            CreateObject(OBJECT_TYPE_PLACEABLE, "q3b_sand_portal", GetLocation(oWP));
            object oSound = GetNearestObjectByTag("Q3B_SOUND_CRYSTAL");
            DestroyObject(oSound);
            object oCrystal = GetNearestObjectByTag("Q3B_CRYSTALBALL");
            DestroyObject(oCrystal);
            object oPortalSound = GetNearestObjectByTag("Q3B_SOUND_PORTAL");
            SoundObjectPlay(oPortalSound);
        }
    }
    else // WRONG button
    {
        DelayCommand(1.0, FloatingTextStrRefOnCreature(76457, oPC));
        SetLocalInt(GetArea(OBJECT_SELF), "Q3B_PORTAL_STATUS", 0); // init the puzzle
        // remove all effects form obelisks:
        int i;
        object oObelisk;
        PlaySound("sce_negative");
        for(i = 1; i <= 6; i++)
        {
            oObelisk = GetNearestObjectByTag("Q3B_PORTAL_PILLAR" + IntToString(i));
            RemoveEffects(oObelisk);
        }

    }
}
