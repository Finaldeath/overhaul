//::///////////////////////////////////////////////
//:: M3Q3CA10Guard.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Guardian appears and takes the sword and
    REMOVES the enchantments from the Dragon, making
    the player capable of defeating it.

    The Guardian then leaves with one line of dialog
    summarizing how, once the dragon is dead,
    the fey and dwarfs will finally be released
    from servitude.

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{

   // * The Sword of Ages summons in the Servant of Ages
   object oSword =   GetItemPossessedBy(GetEnteringObject(),"M3Q3C_SWORDAGES");
   if (GetIsObjectValid(oSword) == TRUE)
   {
      object oGuard = CreateObject(OBJECT_TYPE_CREATURE,"M3Q3C10Guardian" , GetLocation(GetObjectByTag("M3Q3GuardLOC")));
     // effect eVis = EffectVisualEffect(VFX_BEAM_HOLY);
    // ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oGuard);
      AssignCommand(oGuard, DelayCommand(4.0,SpeakOneLinerConversation()));
      DestroyObject(oSword);


   }
}
