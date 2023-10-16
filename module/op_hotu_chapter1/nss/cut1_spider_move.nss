/////////////////////////////////////////////////////////
/* This script is an OnEnter trigger script designed to
   move any interfering spiders in the cutscene away from
   the focus of the scene
*/
/////////////////////////////////////////////////////////
// Created by: Brad Prince
// 12-04-02
/////////////////////////////////////////////////////////
void main()
{
   object oEnter = GetEnteringObject();
   string sName = GetName(oEnter);

   if(sName == "Giant Spider" || sName == "Sword Spider" || sName == "Phase Spider")
      if(GetIsPC(oEnter) == FALSE) {
         AssignCommand(oEnter, ClearAllActions());
         AssignCommand(oEnter, ActionMoveToObject(GetNearestObjectByTag("wp_cut1_spider_move")));
      }
}
