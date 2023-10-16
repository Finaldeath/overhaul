// * go through door a
// * Can I fully generalize this:   Define here whether its light or dark.
int IS_LIGHT = 1;
int IS_DARK = 0;

int PlayerHasTorch(object oPC)
{
    object oLeft = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
    if (GetIsObjectValid(oLeft) == TRUE)
    {
        if (GetTag(oLeft) == "NW_IT_TORCH001")
        {
            return TRUE;
        }
    }
    return FALSE;
}

void main()
{
//M4Q1C09_DOORA1
   string sDest = "";
   int nLight = IS_LIGHT;

    if (GetTag(OBJECT_SELF) == "M4Q1C09_DOORA1")
    {
        sDest = "M4Q1C09_DOORA2";
        nLight = IS_LIGHT;
    }
    else
    if (GetTag(OBJECT_SELF) == "M4Q1C09_DOORA2")
    {
        sDest = "M4Q1C09_DOORA1";
        nLight = IS_DARK;
    }
    else
    // * B Door
    if (GetTag(OBJECT_SELF) == "M4Q1C09_DOORB1")
    {
        sDest = "M4Q1C09_DOORB2";
        nLight = IS_LIGHT;
    }
    else
    if (GetTag(OBJECT_SELF) == "M4Q1C09_DOORB2")
    {
        sDest = "M4Q1C09_DOORB1";
        nLight = IS_LIGHT;
    }
    // * C Door
    else
     if (GetTag(OBJECT_SELF) == "M4Q1C09_DOORC1")
    {
        sDest = "M4Q1C09_DOORC2";
        nLight = IS_DARK;
    }
    else
    if (GetTag(OBJECT_SELF) == "M4Q1C09_DOORC2")
    {
        sDest = "M4Q1C09_DOORC1";
        nLight = IS_DARK;
    }
    // * D Door
    else
     if (GetTag(OBJECT_SELF) == "M4Q1C09_DOORD1")
    {
        sDest = "M4Q1C09_DOORD2";
        nLight = IS_LIGHT;
    }
    else
    if (GetTag(OBJECT_SELF) == "M4Q1C09_DOORD2")
    {
        sDest = "M4Q1C09_DOORD1";
        nLight = IS_DARK;
    }
    // * E Door
    else
     if (GetTag(OBJECT_SELF) == "M4Q1C09_DOORE1")
    {
        sDest = "M4Q1C09_DOORE2";
        nLight = IS_DARK;
    }
    else
    if (GetTag(OBJECT_SELF) == "M4Q1C09_DOORE2")
    {
        sDest = "M4Q1C09_DOORE1";
        nLight = IS_LIGHT;
    }
    // * F Door
    else
     if (GetTag(OBJECT_SELF) == "M4Q1C09_DOORF1")
    {
        sDest = "M4Q1C09_DOORF2";
        nLight = IS_LIGHT;
    }
    else
    if (GetTag(OBJECT_SELF) == "M4Q1C09_DOORF2")
    {
        sDest = "M4Q1C09_DOORF1";
        nLight = IS_LIGHT;
    }
    // * G Door
    else
     if (GetTag(OBJECT_SELF) == "M4Q1C09_DOORG1")
    {
        sDest = "M4Q1C09_DOORG2";
        nLight = IS_DARK;
    }
    else
    if (GetTag(OBJECT_SELF) == "M4Q1C09_DOORG2")
    {
        sDest = "M4Q1C09_DOORG1";
        nLight = IS_LIGHT;
    }
    // * any other door leads you back to the beginning
    else
    {
        sDest = "M4Q1C09_START";
        nLight = IS_LIGHT;
    }


   // * If this is a light portal and player has no light
   // * then send back to center room
   if ( nLight == IS_LIGHT && PlayerHasTorch(GetClickingObject()) == FALSE )
   {
      sDest = "M4Q1C09_START";
   }
   else
   //* PLayer tries to enter a DARK door with a light then reject
   if (nLight == IS_DARK && PlayerHasTorch(GetClickingObject()) == TRUE)
   {
      sDest = "M4Q1C09_START";
   }

  object oClicker = GetClickingObject();
  object oTarget = GetObjectByTag(sDest);

  SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);

  AssignCommand(oClicker,JumpToObject(oTarget));
}
