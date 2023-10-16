// visual effects for portal

void ActivatePortalx()
{
            int nDoOnce = GetLocalInt(GetArea(OBJECT_SELF), "DO_PORTAL_ONCE");
            if(nDoOnce == 1)
                return;
            SetLocalInt(GetArea(OBJECT_SELF), "DO_PORTAL_ONCE", 1);

            int i;
            object oSource;
            object oTarget;
            int nSource;
            int nTarget;
            effect eBeam;
            object oObelisk;
            effect eVis = EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE);
            for (i = 1; i <= 6; i++)
            {
                oObelisk = GetNearestObjectByTag("Q3B_PORTAL_PILLAR" + IntToString(i));
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oObelisk);
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
                object oWP = GetWaypointByTag("Q3B_WP_SAND_PORTAL");
                //CreateObject(OBJECT_TYPE_PLACEABLE, "q3b_sand_portal", GetLocation(oWP));
                object oPortalSound = GetNearestObjectByTag("Q3B_SOUND_PORTAL");
                SoundObjectPlay(oPortalSound);
            }
}

void main()
{
    ActivatePortalx();
    object oPC = GetLastOpenedBy();
    // first, make sure the cutscene is run only once.
    if (GetLocalInt(GetArea(OBJECT_SELF), "DO_CUTSCENE_ONCE") != 1)
    {
        //Check to see if this is a possessed familiar entering the trigger
        if (GetIsPossessedFamiliar(oPC) == TRUE)
        {
            object oMaster = GetMaster(oPC);
            UnpossessFamiliar(oPC);
            DelayCommand(1.5, FloatingTextStrRefOnCreature(40524, oMaster, FALSE));
            AssignCommand(OBJECT_SELF, ActionCloseDoor(OBJECT_SELF));
            return;
        }
        SetLocalInt(GetArea(OBJECT_SELF), "DO_CUTSCENE_ONCE", 1);
        // player who opens the door is the main pc for this cutscene:
        SetLocalString(GetArea(OBJECT_SELF), "Q3B_GATE_OPENED", GetTag(OBJECT_SELF));
        SetLocalObject(OBJECT_SELF, "Q3B_CUTSCENE5_PC", oPC);
        SetLocalObject(GetModule(), "Q3B_CUTSCENE5_TRIGGER", OBJECT_SELF); // used in the abort cutscene event
        ExecuteScript("q3b_heurodisexit", OBJECT_SELF);
    }


}

