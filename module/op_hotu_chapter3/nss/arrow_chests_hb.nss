///////////////////////////////////////////////////////////////////////////////////
// This script will lock an unlock objects depending on which way the arrow faces.
//
// Created by: Brad Prince
// 9-17-02
//
//////////////////////////////////////////////////////////////////////////////////

void main()
{
   float fFacing = GetFacing(OBJECT_SELF);
   object oNorth = GetObjectByTag("chest_north");
   object oSouth = GetObjectByTag("chest_south");
   object oEast = GetObjectByTag("door_east");
   // Variable for random direction calculating.
   int x;

   // Get a random direction.
   if(fFacing >= 85.0 && fFacing <= 95.0) { // North
       x = 3;
       //SetFacing(DIRECTION_EAST);
    }
    else if(fFacing >= 265.0 && fFacing <= 275.0){ // South

       x = 1;
       //SetFacing(DIRECTION_NORTH);
    }
    else if(fFacing >= 175.0 && fFacing <= 185.0){ // West
       x = 1;
       //SetFacing(DIRECTION_NORTH);
    }
    else {
       x = 2;
       //SetFacing(DIRECTION_SOUTH);
    }

   switch(x) {
   case 1:
      SetFacing(DIRECTION_NORTH);
      SetLocked(oNorth, 0);
      if(!GetIsOpen(oSouth))
         SetLocked(oSouth, 1);
      SetLocked(oEast, 1);
      AssignCommand(oEast, ActionCloseDoor(OBJECT_SELF));
      break;
   case 2:
      if(!GetIsOpen(oNorth))
         SetLocked(oNorth, 1);
      SetLocked(oSouth, 0);
      SetLocked(oEast, 1);
      AssignCommand(oEast, ActionCloseDoor(OBJECT_SELF));
      SetFacing(DIRECTION_SOUTH);
      break;
   case 3:
      if(!GetIsOpen(oNorth))
         SetLocked(oNorth, 1);
      if(!GetIsOpen(oSouth))
         SetLocked(oSouth, 1);
      SetLocked(oEast, 0);
      SetFacing(DIRECTION_EAST);
      break;
   default:
      SetLocked(oNorth, 1);
      SetLocked(oSouth, 1);
      SetLocked(oEast, 1);
      AssignCommand(oEast, ActionCloseDoor(OBJECT_SELF));
      SetFacing(DIRECTION_WEST);
      break;
   }
}
