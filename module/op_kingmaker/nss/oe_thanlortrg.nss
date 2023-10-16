void main()
{
    object oPC = GetEnteringObject();

    if((GetLocalInt(GetModule(), "OS_SERAH_HOMESOLD") < 30)
        && (GetLocalInt(GetArea(OBJECT_SELF), "KM_THANLORGHST") == FALSE)
        &&(GetIsPC(oPC) == TRUE))
    {
        SetLocalInt(GetArea(OBJECT_SELF), "KM_THANLORGHST", TRUE);

        effect eGhost = EffectCutsceneGhost();
        effect eVFX = EffectVisualEffect(VFX_DUR_GHOST_TRANSPARENT);

        location lPoint1 = GetLocation(GetObjectByTag("KM_GHOSTWAYA"));
        location lPoint2 = GetLocation(GetObjectByTag("KM_GHOSTWAYB"));
        object oGhost = CreateObject(OBJECT_TYPE_CREATURE, "km_rehanghost", lPoint1);

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, oGhost);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, oGhost);
        AssignCommand(oGhost, ActionForceMoveToLocation(lPoint2));

        DelayCommand(1.0, AssignCommand(oGhost, PlaySound("km1_rehan003")));
        DelayCommand( 1.0f,
            AssignCommand(oGhost, SpeakString("...naref...nareF...")));

        // Make her cry as she walks
        if (Random(2))
        {
            DelayCommand(1.6, AssignCommand(oGhost,
                PlaySound("as_pl_wailingf6")));
        }
        else
        {
            DelayCommand(1.6, AssignCommand(oGhost,
                PlaySound("as_pl_cryingf2")));
        }

        DelayCommand(7.0f, DestroyObject(oGhost));
    }
}
