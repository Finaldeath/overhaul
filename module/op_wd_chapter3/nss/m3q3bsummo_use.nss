//::///////////////////////////////////////////////
//:: Use Script Fired When Ritual Is Succesful
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: December
//:://////////////////////////////////////////////


// * Don't modify this function
void BringInDemon(object oDemon)
 {
   // * make demon face brazier
   AssignCommand(oDemon, ActionDoCommand(SetFacingPoint(GetPosition(OBJECT_SELF))));

   // * Demon needs to check to see if
   // * the object who summoned him (stored on OBJECT_SELF, placeable)
   // * has Protection From Evil cast on him
   // * modules stores and then demon stores object ID of person who summoned him.
   SetLocalObject(oDemon, "NW_L_DEMON_SUMMONER", GetLocalObject(OBJECT_SELF,"NW_L_DEMON_SUMMONER"));

   // * set the resref of the magical item to be made (stored on placeable, moved to demon)
   SetLocalString(oDemon, "NW_J_DEMON_REWARDITEM", GetLocalString(OBJECT_SELF,"NW_J_DEMON_REWARDITEM"));

 /*  if (GetHasSpellEffect(SPELL_PROTECTION_FROM_EVIL, GetLocalObject(OBJECT_SELF,"NW_L_DEMON_SUMMONER")) == FALSE)
   { ;
    // * summoner did not cast protection from evil.
    // * he will now be killed
    ChangeToStandardFaction(oDemon,STANDARD_FACTION_HOSTILE);
   // THIS WORKS:
    AssignCommand(oDemon,DelayCommand(3.5, ActionAttack(GetLocalObject(OBJECT_SELF,"NW_L_DEMON_SUMMONER"))));
    AssignCommand(oDemon, DelayCommand(3.0,SpeakOneLinerConversation()));
   // THIS DOES NOT
   //AssignCommand(oDemon,DetermineCombatRound(GetLocalObject(OBJECT_SELF,"NW_L_DEMON_SUMMONER")));
   }
   else
   {*/
    SetLocalInt(oDemon, "NW_L_TALKSTATE",5);
    AssignCommand(oDemon, DelayCommand(3.0,SpeakOneLinerConversation()));
   //}
}

void MakeDemon(location Loc)
{
   object oDemon = CreateObject(OBJECT_TYPE_CREATURE,GetLocalString(OBJECT_SELF, "NW_J_CREATURERESREF"), Loc);
   BringInDemon(oDemon);
}

void main()

{

   location Loc = GetLocation(GetNearestObjectByTag(GetLocalString(OBJECT_SELF,"NW_J_CREATURELOC")));

   // * play gate summoning effect
   effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_GATE);
   ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, Loc);
   DelayCommand(3.0, MakeDemon(Loc));
}
