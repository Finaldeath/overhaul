//::///////////////////////////////////////////////
//:: Witch Wake: On Player Death
//:: WW_OnPlayerDeath.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     On player death, jump the player and any
     associates to the appropriate Plane of
     Sorrows.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 4, 2002
//:://////////////////////////////////////////////

void NewRemoveEffects(object oTarget)
{
    int bValid;
    effect eEffect = GetFirstEffect(oTarget);
    //Remove any of the following effects
    while (GetIsEffectValid(eEffect) == TRUE)
    {
        int iEffectType = GetEffectType(eEffect);
        if (iEffectType == EFFECT_TYPE_ABILITY_DECREASE ||
            iEffectType == EFFECT_TYPE_AC_DECREASE ||
            iEffectType == EFFECT_TYPE_ATTACK_DECREASE ||
            iEffectType == EFFECT_TYPE_DAMAGE_DECREASE ||
            iEffectType == EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE ||
            iEffectType == EFFECT_TYPE_SAVING_THROW_DECREASE ||
            iEffectType == EFFECT_TYPE_SPELL_RESISTANCE_DECREASE ||
            iEffectType == EFFECT_TYPE_SKILL_DECREASE ||
            iEffectType == EFFECT_TYPE_BLINDNESS ||
            iEffectType == EFFECT_TYPE_DEAF ||
            iEffectType == EFFECT_TYPE_PARALYZE ||
            iEffectType == EFFECT_TYPE_NEGATIVELEVEL ||
            iEffectType == EFFECT_TYPE_FRIGHTENED ||
            iEffectType == EFFECT_TYPE_DAZED ||
            iEffectType == EFFECT_TYPE_CONFUSED ||
            iEffectType == EFFECT_TYPE_POISON ||
            iEffectType == EFFECT_TYPE_DISEASE)
        {
            RemoveEffect(oTarget, eEffect);
        }
        eEffect = GetNextEffect(oTarget);
    }
    //Fire the Restoration SpellCastAt event to make sure things don't goof up.
    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_RESTORATION, FALSE));
}

void main()
{
    object oPC = GetLastPlayerDied();

    //Only handle PCs (& not possessed familiars)
    if (GetIsPC(oPC) == TRUE &&
        GetIsPossessedFamiliar(oPC) == FALSE)
    {
        int iDeaths = GetLocalInt(oPC, "iDeaths");

        object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
        object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
        object oAnimalCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);

        object oWP_DeathX = GetObjectByTag("WP_DeathX");
        object oWP_Death0 = GetObjectByTag("WP_Death0");
        object oWP_Death1 = GetObjectByTag("WP_Death1");
        object oWP_Death2 = GetObjectByTag("WP_Death2");
        object oWP_Death3 = GetObjectByTag("WP_Death3");

        effect eVFX = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
        effect eGhost = EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE);

        //Apply base smoke puff visuals
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oPC));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oFamiliar));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oAnimalCompanion));

        //Play magic forest sound on PC
        AssignCommand(oPC, PlaySound("as_mg_frstmagic4"));

        switch (iDeaths)
        {
            //Module-specific case to handle players who die before being given the
            //Night Hag's tour of the Death System. This variable is set in the
            //WW1_Start_OnEnt script.
            case -1:
            {
                //Apply remaining smoke puff visuals
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oHenchman));
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oWP_DeathX);

                //Play magic forest sound onWaypoint
                AssignCommand(oWP_DeathX, PlaySound("as_mg_frstmagic4"));

                //Jump the player and all associates back to the Dawn area;
                DelayCommand(1.0, AssignCommand(oPC, ActionJumpToObject(oWP_DeathX)));
                DelayCommand(1.0, AssignCommand(oHenchman, ActionJumpToObject(oWP_DeathX)));
                DelayCommand(1.0, AssignCommand(oFamiliar, ActionJumpToObject(oWP_DeathX)));
                DelayCommand(1.0, AssignCommand(oAnimalCompanion, ActionJumpToObject(oWP_DeathX)));

                //Heal them
                effect eHealPC = EffectHeal(GetMaxHitPoints(oPC)+10);
                effect eHealHenchman = EffectHeal(GetMaxHitPoints(oHenchman)+10);
                effect eHealFamiliar = EffectHeal(GetMaxHitPoints(oFamiliar)+10);
                effect eHealAnimalCompanion = EffectHeal(GetMaxHitPoints(oAnimalCompanion)+10);
                DelayCommand(5.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHealPC, oPC));
                DelayCommand(5.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHealHenchman, oHenchman));
                DelayCommand(5.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHealFamiliar, oFamiliar));
                DelayCommand(5.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHealAnimalCompanion, oAnimalCompanion));
            }
            break;

            //If the player has not yet died in this module...
            case 0:
            {
                //Increment their death count.
                SetLocalInt(oPC, "iDeaths", 1);

    /*DEBUG*/// SendMessageToPC(oPC, "Entering Plane of Sorrows #1");

                //Apply remaining smoke puff visuals
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oHenchman));
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oWP_Death0);

                //Play magic forest sound onWaypoint
                AssignCommand(oWP_Death0, PlaySound("as_mg_frstmagic4"));

                //Jump the player and all associates to the first Plane of Sorrow;
                DelayCommand(1.0, AssignCommand(oPC, ActionJumpToObject(oWP_Death0)));
                DelayCommand(1.0, AssignCommand(oHenchman, ActionJumpToObject(oWP_Death0)));
                DelayCommand(1.0, AssignCommand(oFamiliar, ActionJumpToObject(oWP_Death0)));
                DelayCommand(1.0, AssignCommand(oAnimalCompanion, ActionJumpToObject(oWP_Death0)));

            }
            break;

            //If the player has already experienced one previous death in this
            //module...
            case 1:
            {
                //Increment their death count.
                SetLocalInt(oPC, "iDeaths", 2);

    /*DEBUG*/// SendMessageToPC(oPC, "Entering Plane of Sorrows #2");

                //Apply remaining smoke puff visuals
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oHenchman));
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oWP_Death1);

                //Play magic forest sound onWaypoint
                AssignCommand(oWP_Death1, PlaySound("as_mg_frstmagic4"));

                //Jump the player and all associates to the second Plane of Sorrow;
                DelayCommand(1.0, AssignCommand(oPC, ActionJumpToObject(oWP_Death1)));
                DelayCommand(1.0, AssignCommand(oHenchman, ActionJumpToObject(oWP_Death1)));
                DelayCommand(1.0, AssignCommand(oFamiliar, ActionJumpToObject(oWP_Death1)));
                DelayCommand(1.0, AssignCommand(oAnimalCompanion, ActionJumpToObject(oWP_Death1)));
            }
            break;

            //If the player has already experienced two previous deaths in this
            //module...
            case 2:
            {
                //Increment their death count.
                SetLocalInt(oPC, "iDeaths", 3);

    /*DEBUG*/// SendMessageToPC(oPC, "Entering Plane of Sorrows #3");

                //Apply remaining smoke puff visuals
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oHenchman));
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oWP_Death2);

                //Play magic forest sound onWaypoint
                AssignCommand(oWP_Death2, PlaySound("as_mg_frstmagic4"));

                //Jump the player and all associates to the third Plane of Sorrow;
                DelayCommand(1.0, AssignCommand(oPC, ActionJumpToObject(oWP_Death2)));
                DelayCommand(1.0, AssignCommand(oHenchman, ActionJumpToObject(oWP_Death2)));
                DelayCommand(1.0, AssignCommand(oFamiliar, ActionJumpToObject(oWP_Death2)));
                DelayCommand(1.0, AssignCommand(oAnimalCompanion, ActionJumpToObject(oWP_Death2)));
            }
            break;

            //If the player has already experienced three or more previous deaths in
            //this module...
            case 3:
            case 4:
            {
                //Increment their death count.
                SetLocalInt(oPC, "iDeaths", 4);

    /*DEBUG*/// SendMessageToPC(oPC, "Entering Plane of Sorrows #4");

                //Apply remaining smoke puff visuals
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oWP_Death3);

                //Play magic forest sound onWaypoint
                AssignCommand(oWP_Death3, PlaySound("as_mg_frstmagic4"));

                //Jump the player and all associates (except the Henchman) to the
                //fourth Plane of Sorrow. In this one, the Night Hag is unable to
                //return them to the Land of the Living. Instead, she teleports them
                //to Stygia where they will be beset on all sides by monsters.
                DelayCommand(1.0, AssignCommand(oPC, ActionJumpToObject(oWP_Death3)));
                DelayCommand(1.0, AssignCommand(oFamiliar, ActionJumpToObject(oWP_Death3)));
                DelayCommand(1.0, AssignCommand(oAnimalCompanion, ActionJumpToObject(oWP_Death3)));

                //Apply the Ghost Effect
                DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, oPC));
                DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, oFamiliar));
                DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, oAnimalCompanion));
            }
            break;
        }

        //Make them momentarily invulnerable to prevent being double-killed.
        DelayCommand(0.9, SetPlotFlag(oPC, TRUE));
        DelayCommand(0.9, SetPlotFlag(oHenchman, TRUE));
        DelayCommand(0.9, SetPlotFlag(oFamiliar, TRUE));
        DelayCommand(0.9, SetPlotFlag(oAnimalCompanion, TRUE));

        //Resurrect & Heal them, then remove any lingering effects.
        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(), oPC));
        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints(oPC)), oPC));
        DelayCommand(1.0, NewRemoveEffects(oPC));

        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(), oHenchman));
        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints(oHenchman)), oHenchman));
        DelayCommand(1.0, NewRemoveEffects(oHenchman));

        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(), oFamiliar));
        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints(oFamiliar)), oFamiliar));
        DelayCommand(1.0, NewRemoveEffects(oFamiliar));

        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(), oAnimalCompanion));
        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints(oAnimalCompanion)), oAnimalCompanion));
        DelayCommand(1.0, NewRemoveEffects(oAnimalCompanion));

        // * make friendly to Each of the 3 common factions
        AssignCommand(oPC, ClearAllActions());
        if (GetStandardFactionReputation(STANDARD_FACTION_COMMONER, oPC) <= 10)
        {
            SetLocalInt(oPC, "NW_G_Playerhasbeenbad", 10); // * Player bad
            SetStandardFactionReputation(STANDARD_FACTION_COMMONER, 80, oPC);
        }
        if (GetStandardFactionReputation(STANDARD_FACTION_MERCHANT, oPC) <= 10)
        {
            SetLocalInt(oPC, "NW_G_Playerhasbeenbad", 10); // * Player bad
            SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, 80, oPC);
        }
        if (GetStandardFactionReputation(STANDARD_FACTION_DEFENDER, oPC) <= 10)
        {
            SetLocalInt(oPC, "NW_G_Playerhasbeenbad", 10); // * Player bad
            SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, 80, oPC);
        }

        //In case they died while atop the climbing bluff in the WW1 cemetery, flag
        //them as having climbed back down.
        SetLocalInt(oPC, "CemeteryClimb", FALSE);
    }
}
