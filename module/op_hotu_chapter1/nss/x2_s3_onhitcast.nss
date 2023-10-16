//::///////////////////////////////////////////////
//:: User Defined OnHitCastSpell code
//:: x2_s3_onhitcast
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This file can hold your module specific
    OnHitCastSpell definitions

    How to use:
    - Add the Item Property OnHitCastSpell: UniquePower (OnHit)
    - Add code to this spellscript (see below)

   WARNING!
   This item property can be a major performance hog when used
   extensively in a multi player module. Especially in higher
   levels, with each player having multiple attacks, having numerous
   of OnHitCastSpell items in your module this can be a problem.

   It is always a good idea to keep any code in this script as
   optimized as possible.


*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: 2003-07-22
//:://////////////////////////////////////////////

//:: UPDATE August 5/03 - Add Goblin marker Arrows for Level 2 of Undermountain

void main()
{

   object oItem;        // The item casting triggering this spellscript
   object oSpellTarget; // On a weapon: The one being hit. On an armor: The one hitting the armor
   object oSpellOrigin; // On a weapon: The one wielding the weapon. On an armor: The one wearing an armor

   // fill the variables
   oSpellOrigin = OBJECT_SELF;
   oSpellTarget = GetSpellTargetObject();
   oItem        =  GetSpellCastItem();

   if (GetIsObjectValid(oItem))
   {

       // Add your desired behaviour here

       // Example: (make target burst in flames)
       // if (GetTag(oItem) == "my_cool_weapon")
       // {
       //    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_FLAME_M), oSpellTarget);
       // }
          //If a PC is hit by a goblin marker arrow - the Goblin chiefs switches will cause effects
          //on that pc (or associate)
        if (GetTag(oItem) == "q2cmarker")
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_COM_HIT_ACID), oSpellTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_COM_CHUNK_GREEN_MEDIUM), oSpellTarget);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_GLOW_GREEN), oSpellTarget, 30.0);

            if (GetLocalInt(oSpellTarget, "X2_Q2CGoblinMark") == 0)
            {
                SetLocalInt(oSpellTarget, "X2_Q2CGoblinMark", 1);
                FloatingTextStrRefOnCreature(84143 , oSpellTarget);
                object oArea = GetArea(oSpellTarget);
                AssignCommand(oArea, DelayCommand(30.0, SetLocalInt(oSpellTarget, "X2_Q2CGoblinMark", 0)));
            }
        }


   }
   else
   {
        // Error: Spell was not cast by an item
   }
}
