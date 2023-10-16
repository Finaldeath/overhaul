/////////////////////////////////////////////////////////////////////////////////////
// This include file will create the items and blood around Podunk when he dies.
// We don't want the items to land underneath him, so compensation has been done.
//
// Created by: Brad Prince
// 9-13-02
//
/////////////////////////////////////////////////////////////////////////////////////

void CreatePodunkStuff(object oPodunk) {
      // Get Podunk's facing.
      float fFacing = GetFacing(oPodunk);
      float x, y;
      // The distance to create the severed hand and hammer.
      float fDist = 1.0;
      // Positions for the blood effects.
      vector vNPC = GetPosition(oPodunk);
      vector vTarget1;
      vector vTarget2;
      // Locations for the effects.
      location lTarget1;
      location lTarget2;
      location lLoc = GetLocation(oPodunk);

      // Adjusted distances and facings.
      if(fFacing >= 22.5 && fFacing < 67.5){

         x = fDist;
         y = fDist;
      }
      else if(fFacing >= 67.5 && fFacing < 112.5){

         x = 0.0;
         y = fDist;
      }
      else if(fFacing >= 112.5 && fFacing < 157.5){

         x = (-fDist);
         y = fDist;
      }
      else if(fFacing >= 157.5 && fFacing < 202.5){

         x = (-fDist);
         y = 0.0;
      }
      else if(fFacing >= 202.5 && fFacing < 247.5){

         x = (-fDist);
         y = (-fDist);
      }
      else if(fFacing >= 247.5 && fFacing < 292.5){

         x = 0.0;
         y = (-fDist);
      }
      else if(fFacing >= 292.5 && fFacing < 337.5){

         x = fDist;
         y = (-fDist);
      }
      else {

         x = fDist;
         y = 0.0;
      }

     vTarget1 = Vector(vNPC.x + x, vNPC.y + y);
     vTarget2 = Vector(vNPC.x + x - 1.0, vNPC.y + y - 1.0);
     lTarget1 = Location(GetArea(oPodunk), vTarget1, fFacing);
     lTarget2 = Location(GetArea(oPodunk), vTarget2, fFacing);

     // Create blood.
     CreateObject(OBJECT_TYPE_PLACEABLE, "podunk_blood", lLoc);
     CreateObject(OBJECT_TYPE_PLACEABLE, "podunk_blood", lTarget1);
     CreateObject(OBJECT_TYPE_PLACEABLE, "podunk_blood", lTarget2);

     // Create items.
     CreateObject(OBJECT_TYPE_ITEM, "wblmhw003", lTarget2);
     CreateObject(OBJECT_TYPE_ITEM, "grapple_hook", lTarget1);
}
