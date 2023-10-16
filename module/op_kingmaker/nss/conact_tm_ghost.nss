//::///////////////////////////////////////////////
//:: conact_tm_ghost
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Create the ghost of Lady rohan and make her appear
    in the conversation with Becket in the sewer
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////

void main()
{
    effect eGhost = EffectCutsceneGhost();
    effect eVFX = EffectVisualEffect(VFX_DUR_GHOST_TRANSPARENT);

    location lPoint1 = GetLocation(GetObjectByTag("KM_GHOSTWAY_CS"));

    if (GetLocalInt(GetModule(), "OS_SERAH_HOMESOLD") < 30)
    {
        object oGhost = CreateObject(OBJECT_TYPE_CREATURE, "km_rehanghost", lPoint1, FALSE, "SEWER_GHOST");

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, oGhost);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, oGhost);

        // have her play a spasm animation and make her cry
        DelayCommand(1.0,
           AssignCommand(oGhost,
              ActionPlayAnimation(ANIMATION_LOOPING_TALK_PLEADING, -0.3, 9.0f)));

        DelayCommand(1.6, AssignCommand(GetFirstPC(),
            PlaySound("as_pl_cryingf2")));

        DelayCommand(4.0, AssignCommand(oGhost, PlaySound("km1_rehan001")));
        DelayCommand(4.0,
           AssignCommand(oGhost,
              SpeakString("...Naref...nareF...")));

        DelayCommand(12.0, AssignCommand(oGhost, PlaySound("km1_rehan002")));
        DelayCommand(12.0,
           AssignCommand(oGhost,
              SpeakString("...naRef...")));

        DelayCommand(14.0,
           AssignCommand(oGhost,
              ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 3.0, 30.0f)));

        DelayCommand(17.0, DestroyObject(oGhost));
        }
}
