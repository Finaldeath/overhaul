///////////////////////////////////////////////////////////////////////////////////////
// This script will give feedback to the damager of the gong that they need to try
// something else to get it to ring.
//
// Created by: Brad Prince
// 9-13-02
//
///////////////////////////////////////////////////////////////////////////////////////

void main()
{
   object oPC = GetLastDamager();

   //SendMessageToPC(oPC, "[NOT IN STRING EDITOR] That doesn't seem to have enough force to sound the gong. Perhaps something else might");
   SendMessageToPCByStrRef(oPC, 85519);
}
