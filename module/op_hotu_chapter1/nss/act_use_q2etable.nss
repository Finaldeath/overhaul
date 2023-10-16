//::///////////////////////////////////////////////
//:: Name: act_use_q2etable
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 Use the alchemists apparatus placeable. When the table is used,
 a dialogue will pop up allowing the player the opportunity (if he really wants to)
 to try to mix some of the many ingredients together.
 The effect of doing so is determined by a random result of 1 to 10 plus
 an amount equal to 1 to the user's Spellcraft skill
 (so if he has a Spellcraft of 10, it adds an additional 1 to 10).
 The table can only be used five times until it runs out of materials.
1 - Nothing happens except a puff of smoke
2 - 3: 'Evard's Black Tentacles' effect, causes 'Slow' and 2 Strength loss
4 - 5: 'Fireball' effect explosion, causing 10d6 damage
6 : 'Polymorph' effect on the user, turns him into a rat
7 : 'Cloudkill' and 'Slow' effect on the user
8 : blue gas cloud, causing 'Slow' effect
9 : green gas cloud, causes 10d6 acid damage
10 : create a 'Restoration' potion
11 - 12 : create a 'Heal' potion
13 - 14 : create a 'Bull's Strength' potion
15 - 16 : create an 'Endurance' potion
17+ : gain 1000 XP

*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On: Jan 16/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    object oPC = GetPCSpeaker();
    //Can only be used 5 times or it runs out of materials
    if (GetLocalInt(OBJECT_SELF, "nUses") < 5)
    {
        SetLocalInt(OBJECT_SELF, "nUses", GetLocalInt(OBJECT_SELF, "nUses") + 1);

        int nSkillBonus = GetSkillRank(SKILL_SPELLCRAFT, oPC);
        if (nSkillBonus < 0)
            nSkillBonus = 0;
        switch (d10() + nSkillBonus)
        {
            case 1://Nothing happens except a puff of smoke
                        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(OBJECT_SELF));
                        break;
            case 2://'Evard's Black Tentacles' effect, causes 'Slow' and 2 Strength loss
            case 3:     ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectAreaOfEffect(AOE_PER_EVARDS_BLACK_TENTACLES, "nothing", "nothing", "nothing"), GetLocation(oPC), 10.0);
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectLinkEffects(EffectAbilityDecrease(ABILITY_STRENGTH, 2), EffectSlow()), oPC, 30.0);
                        break;
            case 4://'Fireball' effect explosion, causing 10d6 damage
            case 5:
                        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_FIRE), GetLocation(OBJECT_SELF));
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(d6(10), DAMAGE_TYPE_FIRE), oPC);
                        break;
            case 6:// 'Polymorph' effect on the user, turns him into a rat (or badger if we don't have rat)
                        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(OBJECT_SELF));
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectPolymorph(POLYMORPH_TYPE_BADGER), oPC, 60.0);
                        break;
            case 7://'Cloudkill' and 'Slow' effect on the user
                        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectAreaOfEffect(AOE_PER_FOGKILL), GetLocation(oPC), 10.0);
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSlow(), oPC, 30.0);
                        break;
            case 8://blue gas cloud, causing 'Slow' effect
                        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectAreaOfEffect(AOE_PER_FOGMIND, "nothing", "nothing", "nothing"), GetLocation(oPC), 10.0);
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSlow(), oPC, 30.0);
                        break;
            case 9://green gas cloud, causes 10d6 acid damage
                        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectAreaOfEffect(AOE_PER_FOGACID, "nothing", "nothing", "nothing"), GetLocation(oPC), 10.0);
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(d6(10), DAMAGE_TYPE_ACID), oPC);
                        break;
            case 10://create a 'Restoration' potion
                        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(OBJECT_SELF));
                        CreateItemOnObject("x2_it_ptgrrestor", oPC);
                        break;
            case 11://create a 'Heal' potion
            case 12:
                        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(OBJECT_SELF));
                        CreateItemOnObject("nw_it_mpotion012", oPC);
                        break;
            case 13: //create a 'Bull's Strength' potion
            case 14:
                        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(OBJECT_SELF));
                        CreateItemOnObject("nw_it_mpotion015", oPC);
                        break;
            case 15: //create an 'Endurance' potion
            case 16:
                        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(OBJECT_SELF));
                        CreateItemOnObject("nw_it_mpotion013", oPC);
                        break;
            case 17:// 17+ : gain 1000 XP
            default:
                        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(OBJECT_SELF));

                        Reward_2daXP(oPC, XP_HIGH, FALSE);
                        break;

        }
    }
    else
    {
        FloatingTextStrRefOnCreature(84113, oPC);
    }
}
