//////////////////////////////////////////////////////////////////////////////////
// User Defined Events
//
// Heartbeat - This will check to see if the goblin spawner contraptions have been
// destroyed or not. If not, Podunk will run to them to turn them on. He will continue
// to turn them on if they get turned off. Once they have been destroyed, he will
// equip his gear and set himself to a hostile faction.
//
//
// OnDamaged - This will count 2 rounds of damage, then randomly select a coup de
// grace hit. Upon falling down, Podunk will drop his weapon, and lose his hand
// A new armor model was made to reflect this. *note* Does not appear if knockdown
// effect makes Podunk fall on his back.
//
// Created by: Brad Prince
// 9-13-02
//
//////////////////////////////////////////////////////////////////////////////////
#include "podunk_include"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
       int iDestroyed = GetLocalInt(OBJECT_SELF, "destroyed");
       int iStart = GetLocalInt(OBJECT_SELF, "start");
       // Goblin spawner 1.
       object oContraption1 = GetNearestObjectByTag("gob_spawner", OBJECT_SELF, 1);
       int iOn1 = GetLocalInt(oContraption1, "on");
       // Goblin spawner 2.
       object oContraption2 = GetNearestObjectByTag("gob_spawner", OBJECT_SELF, 2);
       int iOn2 = GetLocalInt(oContraption2, "on");
       // Podunk's gear that he will equip when he decides to fight.
       object oHelm = GetItemPossessedBy(OBJECT_SELF, "PodunksEvermournHelm");
       object oHammer = GetItemPossessedBy(OBJECT_SELF, "warhammer");
       // Podunk's waypoint that he will move to while the PC fights
       object oWP = GetWaypointByTag("podunk_stop");
       location lLoc = GetLocation(oWP);
       // This will be various taunts from Podunk.
       string sTaunt;
       // This is the PC.
       object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF);
       // This will store when Podunk has benn defeated.
       int iDefeated = GetLocalInt(OBJECT_SELF, "defeated");

       if(iStart == 1) {
          if(iDestroyed == 2) {
             SetPlotFlag(OBJECT_SELF, 0);
             ChangeFaction(OBJECT_SELF, GetObjectByTag("hostile"));
            //SpeakString("[NOT IN STRING EDITOR] That does it! You have done enough damage here. Time to die!");
             DelayCommand(2.0, ActionMoveToObject(oPC, TRUE, 2.0));
             DelayCommand(6.0, ActionEquipItem(oHelm, INVENTORY_SLOT_HEAD));
             DelayCommand(7.0, ActionEquipItem(oHammer, INVENTORY_SLOT_RIGHTHAND));
             SetLocalInt(OBJECT_SELF, "destroyed", 3);
          }
          else if(iDestroyed != 3) {
             if(iOn1 == 0 && oContraption1 != OBJECT_INVALID) {
                ActionInteractObject(oContraption1);
             }
             else if(iOn2 == 0 && oContraption2 != OBJECT_INVALID) {
                ActionInteractObject(oContraption2);
             }
             else {
                int x = 0;
                x = d8(1);
                // Look at the PC.
                SetFacingPoint(GetPosition(oPC));

                // Only give these random sayings a 50% chance of happening.
                if(d100(1) < 50) {
                   switch(x) {
                   case 1:
                      sTaunt = "[NOT IN STRING EDITOR] Haha! Look at my little machines in action!";
                      break;
                   case 2:
                      sTaunt = "[NOT IN STRING EDITOR] Having second thoughts yet?";
                      break;
                   case 3:
                      sTaunt = "[NOT IN STRING EDITOR] Ready to call me Lord yet?";
                      break;
                   case 4:
                      sTaunt = "[NOT IN STRING EDITOR] I will make a great ruler!";
                      break;
                   case 5:
                      sTaunt = "[NOT IN STRING EDITOR] I'll be sure to let you die slowly so you can enjoy it.";
                      break;
                   case 6:
                      sTaunt = "[NOT IN STRING EDITOR] Had enough?";
                      break;
                   case 7:
                      sTaunt = "[NOT IN STRING EDITOR] I'll be sure to use your family as an energy source.";
                      break;
                   default:
                      sTaunt = "[NOT IN STRING EDITOR] It's too bad you have to die a horrible death. Haha!";
                      break;
                   }
                ActionMoveToObject(oPC, TRUE, 4.0);
                //DelayCommand(4.0, SpeakString(sTaunt));
                }
                else {
                   ActionMoveToObject(oPC, TRUE, 4.0);
                   // Use the hand 50% of the time.
                   if(d2(1) == 1) {
                      DelayCommand(1.5, ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 1.0));
                      DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_BEAM_FIRE_LASH), oPC, 1.2));
                      DelayCommand(3.1, AssignCommand(oPC, ClearAllActions()));
                      DelayCommand(3.2, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectKnockdown(), oPC, 3.0));
                     // DelayCommand(4.2, SpeakString("[NOT IN STRING EDITOR] Haha, I'm unstoppable!"));
                   }
                }
             }
          }
        }
        if(iDefeated == 1) {
           int x = 0;
           x = d8(1);

           // Only give these random sayings a 50% chance of happening.
           if(d100(1) < 50) {
              switch(x) {
              case 1:
                 sTaunt = "Please, do something...";
                 break;
              case 2:
                 sTaunt = "I didn't mean to hurt anyone.";
                 break;
              case 3:
                 sTaunt = "I was just kidding around... ughh!";
                 break;
              case 4:
                 sTaunt = "I didn't kill those people, honest...";
                 break;
              case 5:
                 sTaunt = "I could pay you... please help!";
                 break;
              case 6:
                 sTaunt = "Why'd you have to cut off my hand?";
                 break;
              case 7:
                 sTaunt = "Ouch, this is torture!";
                 break;
              default:
                  sTaunt = "I'm bleeding to death!";
                  break;
              }
                if(!GetIsDead(OBJECT_SELF))
                {
                   //DelayCommand(4.0, SpeakString(sTaunt));
                }
           }
           else
              ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_RED_SMALL), OBJECT_SELF);
        }
    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {
       object oPC = GetLastDamager();
       int iDamaged = GetLocalInt(OBJECT_SELF, "damaged");
       // The PC armor version that is missing the hand.
       object oArmor = GetItemPossessedBy(OBJECT_SELF, "podunks_armor");
       object oHammer = GetItemPossessedBy(OBJECT_SELF, "warhammer");
       object oFakeArmor = GetObjectByTag("podunks_fake_armor");
       // This will be used for fighting taunts.
       string sTaunt;
       float fDelay;
       // This sets when Podunk has been defeated.
       int iDefeated = GetLocalInt(OBJECT_SELF, "defeated");
       int iDroppedStuff = GetLocalInt(OBJECT_SELF, "dropped_stuff");

       if(iDamaged >= 2) {
          int x = 0;
          x = d2(1);

          if(x == 1 && iDroppedStuff != 1) {
             ClearAllActions();
             SurrenderToEnemies();
             DestroyObject(oHammer);
             DelayCommand(0.3, PlaySound("vs_faldom_dead"));
             DelayCommand(0.4, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_RED_SMALL), OBJECT_SELF));
             DelayCommand(0.6, ActionEquipMostEffectiveArmor());
             DelayCommand(0.9, CreatePodunkStuff(OBJECT_SELF));
             DelayCommand(1.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_RED_SMALL), OBJECT_SELF));
             DelayCommand(0.7, ClearAllActions());
             // The armor is being equipped twice to work around a problem where
             // it seems to only work occassionally.
             DelayCommand(0.8, ActionEquipItem(oArmor, INVENTORY_SLOT_CHEST));
             DelayCommand(1.2, ActionEquipItem(oArmor, INVENTORY_SLOT_CHEST));
             DelayCommand(1.6, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_RED_SMALL), OBJECT_SELF));
             DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectKnockdown(), OBJECT_SELF));
             //DelayCommand(3.5, SpeakString("[NOT IN STRING EDITOR] Ahhh! My hand! You've severed my hand!"));
             DelayCommand(5.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_RED_SMALL), OBJECT_SELF));
             DelayCommand(6.0, SetLocalInt(OBJECT_SELF, "defeated", 1));
             DelayCommand(6.5, GiveXPToCreature(oPC, 500));
             DelayCommand(6.6, AddJournalQuestEntry("podunk", 20, oPC, FALSE, FALSE));
             SetLocalInt(OBJECT_SELF, "dropped_stuff", 1);
             object oPed44 = GetObjectByTag("ped44");
             object oPed54 = GetObjectByTag("ped54");
             // This sets the variables to unblock the area so a PC can get out.
             SetLocalInt(oPed44, "fighting", 0);
             SetLocalInt(oPed54, "fighting", 0);
          }
       }
          else {
             int y = 0;
             y = d4(1);

             // Only give these random sayings a 70% chance of happening.
             if(d100(1) < 70) {
                switch(y) {
                case 1:
                   sTaunt = "Is that all you got?";
                   fDelay = 0.0;
                   break;

                case 2:
                   sTaunt = "This is for that 'little man' comment!";
                   fDelay = 1.5;
                   break;
                case 3:
                   sTaunt = "I'm going to keep your head as a trophy.";
                   fDelay = 0.5;
                   break;

                default:
                   sTaunt = "Your body is going to look good down with the other piles!";
                   fDelay = 1.5;
                   break;
                   }
                //DelayCommand(fDelay, SpeakString(sTaunt));
             }
          // Only keep track when they are "supposed" to be fighting him.
          if(GetPlotFlag(OBJECT_SELF) == 0)
             SetLocalInt(OBJECT_SELF, "damaged", iDamaged + 1);
          }
          // Next hit will kill him.
          if(iDefeated == 1) {
              DelayCommand(0.1, PlaySound("vs_faldom_dead"));
              DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_RED_MEDIUM), OBJECT_SELF));
              DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), OBJECT_SELF));
              DelayCommand(1.0, GiveXPToCreature(oPC, 2000));
              DelayCommand(1.0, AddJournalQuestEntry("podunk", 30, oPC, FALSE, FALSE));
          }
       }

    else if(nUser == 1007) // DEATH
    {

    }
    else if(nUser == 1008) // DISTURBED
    {

    }
}

