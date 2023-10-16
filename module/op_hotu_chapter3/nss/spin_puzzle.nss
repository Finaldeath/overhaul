////////////////////////////////////////////////////////////////////////////////////
// This script is designed to spin the arrow placeable in a new direction every
// heartbeat.  This arrow, and its direction, will set the position that the PC will
// get jumped to upon pulling the associated lever.  In the event that a PC pulls
// a lever and there is no legal destination, they will get jumped to either the
// starting position of the puzzle, or the ending position, depending on if they
// have been through it yet or not.
//
// This script handles all cases, and it can be used on any number of arrow
// placeables.  The vector jumping is being done in intervals of 20.0, and this
// can easily be modified by changing the fInterval variable.  Further functionality
// is described below.
//
// Created by: Brad Prince
// 9-13-02
//
////////////////////////////////////////////////////////////////////////////////////

void main()
{
    object oPC = GetFirstObjectInShape(SHAPE_SPHERE, 3.0, GetLocation(OBJECT_SELF), FALSE,
                 OBJECT_TYPE_CREATURE);
    // Determine if the PC has gone through the puzzle yet.  This will tell us how
    // to set their "illegal" destinations.  For example, an illegal move the first
    // time through will put the PC back at the start position.  We don't want an "easy"
    // jump through on the return trip.
    int iStart = GetLocalInt(oPC, "spin_puzzle_start");
    object oStart = GetObjectByTag("spin_puzzle_start");
    object oEnd = GetObjectByTag("spin_puzzle_end");
    // This will be the illegal destination.
    object oIllegal;
    // This will be the spinning arrow's new direction.
    float fFacing = GetFacing(OBJECT_SELF);
    // This is the jumping interval.  Change this for different distances.
    float fInterval = 20.0;
    // This will be set to determine exactly where the lever user will land.
    location lFinalDestination;
    // This is the lever closest to this spinning arrow.
    object oLever = GetNearestObjectByTag("spin_lever");
    // The destination arrow that the current one will teleport the
    // user to when pulled. This will be determined based on the direction
    // the current arrow is facing.
    vector vPullDestination;
    // Get the vector position of the spinning arrow so we can calculate a new
    // position.
    vector vSelf = GetPosition(OBJECT_SELF);
    // Gather the illegal jump information from the spinning arrow's tag.  This allows
    // for the possibility to block certain jump directions, based on the following
    // conventions.  The ending letters can be assigned so that they will block
    // a direction.  A tag of xxxxx_BN_BS would block both north and south jumping.
    // A tag of xxxxx_BN_BS_BW would block north, south, and west jumping.
    //
    // BN = Block North, BS = Block South, BE = Block East, BW = Block West.
    // 3 directions can be blocked per arrow.
    string sIllegalBase = GetStringRight(GetTag(OBJECT_SELF), 8);
    string sIllegal1 = GetStringLeft(sIllegalBase, 2);
    string sIllegalBase2 = GetStringRight(sIllegalBase, 5);
    string sIllegal2 = GetStringLeft(sIllegalBase2, 2);
    string sIllegal3 = GetStringRight(sIllegalBase2, 2);
    /*
        // Variable for random direction calculating.
        int x;

        // Get a random direction.
        x = 0;
        x = d4(1);

        switch(x) {
        case 1:
           SetFacing(DIRECTION_NORTH);
           break;
        case 2:
           SetFacing(DIRECTION_SOUTH);
           break;
        case 3:
           SetFacing(DIRECTION_EAST);
           break;
        default:
           SetFacing(DIRECTION_WEST);
           break;
        }
    */


    // Changed due to feedback. Sept 22, 2003.
    //Set a new facing. Go clockwise.
    if(fFacing >= 85.0 && fFacing <= 95.0) { // North
       SetFacing(DIRECTION_EAST);
    }
    else if(fFacing >= 265.0 && fFacing <= 275.0){ // South
       SetFacing(DIRECTION_WEST);
    }
    else if(fFacing >= 175.0 && fFacing <= 185.0){ // West
       SetFacing(DIRECTION_NORTH);
    }
    else {
       SetFacing(DIRECTION_SOUTH);
    }

    fFacing = GetFacing(OBJECT_SELF);

    // Set the illegal location for the PC.
    if(iStart == 1)
       oIllegal = oEnd;
    else
       oIllegal = oStart;

    // Find which direction is currently being faced, then set a variable to be
    // used by the lever (oTargetDirection). If it is an illegal direction,
    // set the destination to be the start point.
    if(fFacing >= 85.0 && fFacing <= 95.0) { // North
       if(sIllegal1 == "BN" || sIllegal2 == "BN" || sIllegal3 == "BN")
          vPullDestination = GetPosition(oIllegal);
       else
          vPullDestination = Vector(vSelf.x, vSelf.y + fInterval, vSelf.z);
    }
    else if(fFacing >= 265.0 && fFacing <= 275.0){ // South
       if(sIllegal1 == "BS" || sIllegal2 == "BS" || sIllegal3 == "BS")
          vPullDestination = GetPosition(oIllegal);
       else
          vPullDestination = Vector(vSelf.x, vSelf.y - fInterval, vSelf.z);
    }
    else if(fFacing >= 175.0 && fFacing <= 185.0){ // West
       if(sIllegal1 == "BW" || sIllegal2 == "BW" || sIllegal3 == "BW")
          vPullDestination = GetPosition(oIllegal);
       else
          vPullDestination = Vector(vSelf.x - fInterval, vSelf.y, vSelf.z);
    }
    else {
       if(sIllegal1 == "BE" || sIllegal2 == "BE" || sIllegal3 == "BE") // East
          vPullDestination = GetPosition(oIllegal);
       else
          vPullDestination = Vector(vSelf.x + fInterval, vSelf.y, vSelf.z);
    }

    // Create a new location for the user to land on.
    lFinalDestination = Location(GetArea(OBJECT_SELF), vPullDestination, fFacing);

    // Assign the target to the lever nearest it (on same island).
    SetLocalLocation(oLever, "destination", lFinalDestination);
}
