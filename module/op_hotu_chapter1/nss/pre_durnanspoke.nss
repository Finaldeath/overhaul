// sets the "Durnan Spoke" global to 1
// indicating that Durnan has already given his first speech
// also sets the custom strings for the PC hero

void main()
{
    //Freeze the PC so he doesn't walk around while talking to Durnan
    object oPC = GetPCSpeaker();
    object oArea = GetArea(oPC);
    AssignCommand(oArea, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneImmobilize(), oPC));


    SetLocalInt(GetModule(), "DurnanSpoke", 1);

    // <CUSTOM1001> will be the PC Hero's name
    SetCustomToken(1001, GetName(GetPCSpeaker()));

    // <CUSTOM1002> will be either "he" or "she" in reference to the PC hero
    // <CUSTOM1003> will be either "him" or "her" in reference to the PC hero
    // <CUSTOM1004> will be either "his" or "her" in reference to the PC hero
    if ((GetGender(GetPCSpeaker())) == GENDER_MALE)
    {
        SetCustomToken(1002, GetStringByStrRef(4871));
        SetCustomToken(1003, GetStringByStrRef(4875));
        SetCustomToken(1004, GetStringByStrRef(4878));
        //SetCustomToken(1002, "he");
        //SetCustomToken(1003, "him");
        //SetCustomToken(1004, "his");
    }
    else
    {
        SetCustomToken(1002, GetStringByStrRef(4872));
        SetCustomToken(1003, GetStringByStrRef(4876));
        SetCustomToken(1004, GetStringByStrRef(4876));
        //SetCustomToken(1002, "she");
        //SetCustomToken(1003, "her");
        //SetCustomToken(1004, "her");
    }

    //Grab all of the NPCs who are listening to Durnan and make them pay
    //attention to them
    object oTomi = GetObjectByTag("pre_tomi");
    object oDaelan = GetObjectByTag("pre_daelan");
    object oLinu = GetObjectByTag("pre_linu");
    object oSharwyn = GetObjectByTag("pre_sharwyn");

    SetCommandable(TRUE, oTomi);
    SetCommandable(TRUE, oDaelan);
    SetCommandable(TRUE, oLinu);
    SetCommandable(TRUE, oSharwyn);

    object oGlim = GetObjectByTag("cut1_glim");
    object oTamsil = GetObjectByTag("Tamsil1");
    object oLafontaine = GetObjectByTag("cut1_lafontaine");
    object oSabine = GetObjectByTag("cut1_sabine");
    AssignCommand(oTomi, SetFacingPoint(GetPosition(GetObjectByTag("q2adurnan"))));
    AssignCommand(oTomi, PlayAnimation(ANIMATION_LOOPING_LISTEN));
    AssignCommand(oLinu, SetFacingPoint(GetPosition(GetObjectByTag("q2adurnan"))));
    AssignCommand(oLinu, PlayAnimation(ANIMATION_LOOPING_LISTEN));
    AssignCommand(oSharwyn, SetFacingPoint(GetPosition(GetObjectByTag("q2adurnan"))));
    AssignCommand(oSharwyn, PlayAnimation(ANIMATION_LOOPING_LISTEN));
    AssignCommand(oDaelan, SetFacingPoint(GetPosition(GetObjectByTag("q2adurnan"))));
    AssignCommand(oDaelan, PlayAnimation(ANIMATION_LOOPING_LISTEN));
    AssignCommand(oGlim, SetFacingPoint(GetPosition(GetObjectByTag("q2adurnan"))));
    AssignCommand(oGlim, PlayAnimation(ANIMATION_LOOPING_LISTEN));
    AssignCommand(oTamsil, SetFacingPoint(GetPosition(GetObjectByTag("q2adurnan"))));
    AssignCommand(oTamsil, PlayAnimation(ANIMATION_LOOPING_LISTEN));
    AssignCommand(oLafontaine, SetFacingPoint(GetPosition(GetObjectByTag("q2adurnan"))));
    AssignCommand(oLafontaine, PlayAnimation(ANIMATION_LOOPING_LISTEN));
    AssignCommand(oSabine, SetFacingPoint(GetPosition(GetObjectByTag("q2adurnan"))));
    AssignCommand(oSabine, PlayAnimation(ANIMATION_LOOPING_LISTEN));
}
