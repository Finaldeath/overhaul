void main()
{
    object oPC = GetClickingObject();
    //if the PC still owes money - turn them into a penguin
    if (GetLocalInt(oPC, "X1_Q7ChargesToPayFor") > 0 && GetLocalInt(oPC, "X1_Q7_IMAPENGUIN") != 1)
    {
        AssignCommand(oPC, ClearAllActions());
        SetCommandable(FALSE, oPC);
        object oHermit = GetObjectByTag("q7hermit");
        AssignCommand(oHermit, SpeakStringByStrRef(40268));
        AssignCommand(oHermit, ActionCastFakeSpellAtObject(SPELL_HOLD_PERSON, oPC));
        effect eVis1 = EffectVisualEffect(VFX_IMP_EVIL_HELP);
        DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis1, GetLocation(oPC)));
        effect ePoly1 = EffectPolymorph(POLYMORPH_TYPE_PENGUIN);
        effect eExtraP1 = ExtraordinaryEffect(ePoly1);
        effect ePoly = SupernaturalEffect(eExtraP1);

        DelayCommand(2.3, AssignCommand(oHermit, ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePoly, oPC)));
        DelayCommand(5.0, AssignCommand(oHermit, SpeakStringByStrRef(40269)));
        SetLocalInt(oPC, "X1_Q7_IMAPENGUIN", 1);
        DelayCommand(5.0, SetCommandable(TRUE, oPC));
        AssignCommand(OBJECT_SELF, ActionCloseDoor(OBJECT_SELF));
        SetLocked(OBJECT_SELF, TRUE);
    }
    else
    {

        object oTarget = GetTransitionTarget(OBJECT_SELF);
        location lLoc = GetLocation(oTarget);

        AssignCommand(oPC,JumpToLocation(lLoc));
    }
}
