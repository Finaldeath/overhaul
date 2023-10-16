//::///////////////////////////////////////////////
//:: M3Q2F20MUSICAL
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 Fairy flies around and plays the different gongs
 giving players a clue
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////


void main()
{
      // * must see a player in order to start
  if(!GetIsObjectValid(GetNearestObjectByTag("M3Q1F20Gong1")))
  {
        ActionSpeakStringByStrRef(65704);
        effect eFairy = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1);
        location lFairy = GetLocation(OBJECT_SELF);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eFairy,lFairy);
       DestroyObject(OBJECT_SELF);\
  }
  else if ((GetLocalInt(OBJECT_SELF,"NW_L_BUSY") == 0) && GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN)))
  {
//  ClearAllActions();
  SetLocalString(GetArea(OBJECT_SELF), "NW_GAREA_GONGPUZZLEDESIRED", "43121324");
  string sNotes =  GetLocalString(GetArea(OBJECT_SELF), "NW_GAREA_GONGPUZZLEDESIRED");
//  SpeakString("desired " + sNotes);
  string sMove = "";

      SetLocalInt(OBJECT_SELF,"NW_L_BUSY",1);
      int i;
      for (i = 0; i<8; i++)
      {
        sMove = GetSubString(sNotes, i, 1);

//        SpeakString("Pos: " + IntToString(i) + " Value: "+sMove +"*");
        ActionInteractObject(GetNearestObjectByTag("M3Q1F20Gong" + sMove));
        ActionWait(3.0);
      }
        ActionSpeakStringByStrRef(61903);
        // * Wait seconds before start again
        ActionWait(12.0);
        ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_L_BUSY",0));
        ActionDoCommand(SetCommandable(TRUE));
//  SetCommandable(FALSE);     not working for some reason, fairy can be interrupted
  }
}
