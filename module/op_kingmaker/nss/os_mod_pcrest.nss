//::///////////////////////////////////////////////
//:: os_mod_pcrest
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On module player rested, included restoring Kidalas
    form and the ghostly activity in the Thanlor Manor.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////

void main()
{
    object oKai = GetObjectByTag("os_hen_kai");
    //if Kaidala was in a shifted state before resting
    if(GetLocalInt(oKai,"OS_KAI_SHAPE")==10)
    {
        SetLocalInt(oKai,"OS_KAI_SHAPE",0);
    }

    object oPC = GetFirstPC();
    object oArea = GetArea(oPC);
    object oChair, oGhost;
    location lSpawn;
    float fFacing, fX, fY;
    vector vSpawn, vChair;

    effect eGhost = EffectCutsceneGhost();
    effect eVFX = EffectVisualEffect(VFX_DUR_GHOST_TRANSPARENT);
    effect eInvis = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);

    if (GetLocalInt(GetModule(), "OS_SERAH_HOMESOLD") < 30)
    {
        oGhost = GetObjectByTag("q2_rehanghost");

        // PC is resting in the ghost house
        if ((GetTag(oArea)=="q2c22b")
            && (GetIsResting(oPC))
            && (oGhost == OBJECT_INVALID))
        {
            oChair = GetNearestObjectByTag("km_ghostseat", oPC, 2);
            vChair = GetPosition(oChair);
            fFacing = GetFacing(oChair);

            // Calculate a safe spawn distance infrount of the invisible object.
            fX = (-((fFacing - 90.0f) / 90.0f))/ 3.0f;
            fY = ((fFacing - 180.0f) / 90.0f) / 3.0f;
            vSpawn = Vector(fX, fY, 0.0);

            lSpawn = Location(oArea, vSpawn + vChair, fFacing);
            oGhost = CreateObject(OBJECT_TYPE_CREATURE, "km_rehanghost", lSpawn);
            AssignCommand(oGhost, ClearAllActions());

            //spawn the ghost and be scary
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, oGhost);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, oGhost);

            AssignCommand(oGhost, ActionSit(oChair));
            DelayCommand(2.1, AssignCommand(oPC, ClearAllActions()));

            // Make her cry
            if (Random(2))
            {
                DelayCommand(2.5, AssignCommand(oPC, PlaySound("as_pl_wailingf6")));
            }
            else
            {
                DelayCommand(2.5, AssignCommand(oPC, PlaySound("as_pl_cryingf2")));
            }

            DelayCommand(1.7, AssignCommand(oGhost, PlaySound("km1_rehan001")));
            AssignCommand(oGhost, DelayCommand(1.7, SpeakString("Naref... Naref...")));

            DelayCommand(3.0f,
                FloatingTextStringOnCreature("A haunting voice disturbs your rest...", oPC));

            DelayCommand(6.0f,
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eInvis, oGhost, 10.2f));

            DelayCommand(7.0f, ClearAllActions(TRUE));
            DelayCommand(8.0f, DestroyObject(oGhost));

        }
    }
}
