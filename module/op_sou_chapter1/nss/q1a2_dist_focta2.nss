//::///////////////////////////////////////////////
//:: Name: q1a2_dist_focta2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
This script in the OnDisturbed event of the focus crystal
making table watches for the following:

- a quartz crystal
- any two of: aventurine, phenalope, amethyst or fluorspar

Once a combo of the proper three has been put inside the table's
inventory, create a special effect on the alchemist table,
destroy the three gems and create a focus crystal in inventory...
hopefully all without closing the inventory box.

Easter Egg combos for the machine
1 Quartz crystal + Green Spores(q1greenspore) from the Old Farm House - Ring of Disease Resistence(X0_IT_MRING010)
1 Quartz and the Shadow Hart's Heart = Lesser Amulet of Health
//2 Fenberries and the 1 Empty bottle = potion of barkskin
//The Practice Sword and the 1 Quartz Crystal = Timonen Great Sword

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 23/03
//:://////////////////////////////////////////////
void WhatsInMachine();
void ZeroAllVariables();
void CreateSomething(string szThing);

void main()
{
    //Check to see if inventory has been added or removed...
    //On added to
    if (GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_ADDED)
    {
        //Calculate what's now in the gem grinder
        WhatsInMachine();

        //Check to see if there is enough of the ingredients to make a focus crystal
        if (GetLocalInt(OBJECT_SELF, "nQuartz") > 0 && GetLocalInt(OBJECT_SELF, "nGemTotal") > 1)
        {
            //Create a focus crystal

            //Effects
            location lTable = GetLocation(GetObjectByTag("q1a2focustable"));
            DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lTable));
            DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lTable));
            DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lTable));
            DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_MIND), lTable));

            location lGrinder = GetLocation(GetObjectByTag("q1a2focustableinv"));
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lGrinder);
            DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lGrinder));
            DelayCommand(0.75, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lGrinder));
            DelayCommand(0.75, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_PWSTUN), lGrinder));


            //Create the crystal
            DelayCommand(0.5,CreateSomething("focuscrystal"));

            //Adjust the variables
            int nGemsRemoved = 2;
            int nStackDestroy;
            SetLocalInt(OBJECT_SELF, "nFocusCrystal", GetLocalInt(OBJECT_SELF, "nFocusCrystal") + 1);
            SetLocalInt(OBJECT_SELF, "nGemTotal", GetLocalInt(OBJECT_SELF, "nGemTotal") - 2);
            SetLocalInt(OBJECT_SELF, "nQuartz", GetLocalInt(OBJECT_SELF, "nQuartz") - 1);

            //Destroy Quartz
            object oToDestroy = GetItemPossessedBy(OBJECT_SELF, "NW_IT_MSMLMISC11");
            DelayCommand(0.2,DestroyObject(oToDestroy));
            //SendMessageToPC(GetFirstPC(), "1 Quartz removed");

            while (nGemsRemoved > 0)
            {
                //Destroy any Aventurine
                if (GetLocalInt(OBJECT_SELF, "nAventurine") > 0)
                {
                    //Get the number of stacked gems that are in the machine
                    oToDestroy = GetItemPossessedBy(OBJECT_SELF, "NW_IT_GEM014");
                    nStackDestroy = GetNumStackedItems(oToDestroy);
                    //if there are 3 or more gems of this type
                    if (nStackDestroy > 2)
                    {
                        SetItemStackSize(oToDestroy, nStackDestroy - 2);
                        nGemsRemoved = nGemsRemoved - 2;
                        SetLocalInt(OBJECT_SELF, "nAventurine", GetLocalInt(OBJECT_SELF, "nAventurine") - 2);
                        //SendMessageToPC(GetFirstPC(), "2 Aventurine Removed - some left");
                    }
                    else if (nStackDestroy == 2)
                    {
                        DelayCommand(0.2,DestroyObject(oToDestroy));
                        SetLocalInt(OBJECT_SELF, "nAventurine", GetLocalInt(OBJECT_SELF, "nAventurine") - 2);
                        nGemsRemoved = nGemsRemoved - 2;
                        //SendMessageToPC(GetFirstPC(), "2 Aventurine Removed - all removed");
                    }
                    //else if there is only 1 gem of this type
                    else
                    {
                        DelayCommand(0.2,DestroyObject(oToDestroy));
                        SetLocalInt(OBJECT_SELF, "nAventurine", GetLocalInt(OBJECT_SELF, "nAventurine") - 1);
                        nGemsRemoved = nGemsRemoved - 1;
                        //SendMessageToPC(GetFirstPC(), "1 Aventurine Removed");
                    }
                }
                //Destroy any Fluorspar
                else if (GetLocalInt(OBJECT_SELF, "nFluorspar") > 0)
                {
                    //Get the number of stacked gems that are in the machine
                    oToDestroy = GetItemPossessedBy(OBJECT_SELF, "NW_IT_GEM015");
                    nStackDestroy = GetNumStackedItems(oToDestroy);
                    //if there are 3 or more gems of this type
                    if (nStackDestroy > 2)
                    {
                        SetItemStackSize(oToDestroy, nStackDestroy - 2);
                        nGemsRemoved = nGemsRemoved - 2;
                        SetLocalInt(OBJECT_SELF, "nFluorspar", GetLocalInt(OBJECT_SELF, "nFluorspar") - 2);
                        //SendMessageToPC(GetFirstPC(), "2 Fluorspar Removed - some left");
                    }
                    else if (nStackDestroy == 2)
                    {
                        DelayCommand(0.2,DestroyObject(oToDestroy));
                        SetLocalInt(OBJECT_SELF, "nFluorspar", GetLocalInt(OBJECT_SELF, "nFluorspar") - 2);
                        nGemsRemoved = nGemsRemoved - 2;
                        //SendMessageToPC(GetFirstPC(), "2 Fluorspar Removed - all removed");
                    }
                    //else if there is only 1 gem of this type
                    else
                    {
                        DelayCommand(0.2,DestroyObject(oToDestroy));
                        SetLocalInt(OBJECT_SELF, "nFluorspar", GetLocalInt(OBJECT_SELF, "nFluorspar") - 1);
                        nGemsRemoved = nGemsRemoved - 1;
                        //SendMessageToPC(GetFirstPC(), "1 Fluorspar Removed");
                    }
                }
                //Destroy any Phenalope
                else if (GetLocalInt(OBJECT_SELF, "nPhenalope") > 0)
                {
                    //Get the number of stacked gems that are in the machine
                    oToDestroy = GetItemPossessedBy(OBJECT_SELF, "NW_IT_GEM004");
                    nStackDestroy = GetNumStackedItems(oToDestroy);
                    //if there are 3 or more gems of this type
                    if (nStackDestroy > 2)
                    {
                        SetItemStackSize(oToDestroy, nStackDestroy - 2);
                        nGemsRemoved = nGemsRemoved - 2;
                        SetLocalInt(OBJECT_SELF, "nPhenalope", GetLocalInt(OBJECT_SELF, "nPhenalope") - 2);
                        //SendMessageToPC(GetFirstPC(), "2 Phenalope Removed - some left");
                    }
                    else if (nStackDestroy == 2)
                    {
                        DelayCommand(0.2,DestroyObject(oToDestroy));
                        SetLocalInt(OBJECT_SELF, "nPhenalope", GetLocalInt(OBJECT_SELF, "nPhenalope") - 2);
                        nGemsRemoved = nGemsRemoved - 2;
                        //SendMessageToPC(GetFirstPC(), "2 Phenalope Removed - all removed");

                    }
                    //else if there is only 1 gem of this type
                    else
                    {
                        DelayCommand(0.2,DestroyObject(oToDestroy));
                        SetLocalInt(OBJECT_SELF, "nPhenalope", GetLocalInt(OBJECT_SELF, "nPhenalope") - 1);
                        nGemsRemoved = nGemsRemoved - 1;
                        //SendMessageToPC(GetFirstPC(), "1 Phenalope Removed");

                    }
                }
                //Destroy any Amethyst
                else if (GetLocalInt(OBJECT_SELF, "nAmethyst") > 0)
                {
                    //Get the number of stacked gems that are in the machine
                    oToDestroy = GetItemPossessedBy(OBJECT_SELF, "NW_IT_GEM003");
                    nStackDestroy = GetNumStackedItems(oToDestroy);
                    //if there are 3 or more gems of this type
                    if (nStackDestroy > 2)
                    {
                        SetItemStackSize(oToDestroy, nStackDestroy - 2);
                        nGemsRemoved = nGemsRemoved - 2;
                        SetLocalInt(OBJECT_SELF, "nAmethyst", GetLocalInt(OBJECT_SELF, "nAmethyst") - 2);
                        //SendMessageToPC(GetFirstPC(), "2 Amethyst Removed - some left");

                    }
                    else if (nStackDestroy == 2)
                    {
                        DelayCommand(0.2,DestroyObject(oToDestroy));
                        SetLocalInt(OBJECT_SELF, "nAmethyst", GetLocalInt(OBJECT_SELF, "nAmethyst") - 2);
                        nGemsRemoved = nGemsRemoved - 2;
                        //SendMessageToPC(GetFirstPC(), "2 Amethyst Removed - all removed");
                    }
                    //else if there is only 1 gem of this type
                    else
                    {
                        DelayCommand(0.2,DestroyObject(oToDestroy));
                        SetLocalInt(OBJECT_SELF, "nAmethyst", GetLocalInt(OBJECT_SELF, "nAmethyst") - 1);
                        nGemsRemoved = nGemsRemoved - 1;
                        //SendMessageToPC(GetFirstPC(), "1 Amethyst Removed");
                    }
                }
            }
        }
        //EASTER EGG CREATIONS
        //1 Quartz and the Green Spores from the Old Farm House
        else if (GetLocalInt(OBJECT_SELF, "nQuartz") > 0 && GetLocalInt(OBJECT_SELF, "nGreenSpore") > 0)
        {
            //Create a ring of Disease resistence once
            if (GetLocalInt(OBJECT_SELF, "nDiseaseRing") != 1)
            {
                SetLocalInt(OBJECT_SELF, "nDiseaseRing", 1);
                //Effects
                location lTable = GetLocation(GetObjectByTag("q1a2focustable"));
                DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lTable));
                DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lTable));
                DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lTable));
                DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_MIND), lTable));

                location lGrinder = GetLocation(GetObjectByTag("q1a2focustableinv"));
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lGrinder);
                DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lGrinder));
                DelayCommand(0.75, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lGrinder));
                DelayCommand(0.75, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_PWSTUN), lGrinder));


                //Create the crystal
                DelayCommand(0.5, CreateSomething("x0_it_mring010"));

                //Adjust the variables
                SetLocalInt(OBJECT_SELF, "nQuartz", GetLocalInt(OBJECT_SELF, "nQuartz") - 1);
                SetLocalInt(OBJECT_SELF, "nGreenSpore", GetLocalInt(OBJECT_SELF, "nGreenSpore") - 1);
                //Destroy Quartz
                object oToDestroy = GetItemPossessedBy(OBJECT_SELF, "NW_IT_MSMLMISC11");
                DelayCommand(0.2,DestroyObject(oToDestroy));
                //Destroy Spores
                oToDestroy = GetItemPossessedBy(OBJECT_SELF, "q1greenspore");
                DelayCommand(0.2,DestroyObject(oToDestroy));
            }
        }
        //1 Quartz and the Shadow Hart's Heart
        else if (GetLocalInt(OBJECT_SELF, "nQuartz") > 0 && GetLocalInt(OBJECT_SELF, "nShadowHeart") > 0)
        {
            //Create a lesser amulet of aid once
            if (GetLocalInt(OBJECT_SELF, "nAidAmulet") != 1)
            {
                SetLocalInt(OBJECT_SELF, "nAidAmulet", 1);
                //Effects
                location lTable = GetLocation(GetObjectByTag("q1a2focustable"));
                DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lTable));
                DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lTable));
                DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lTable));
                DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_MIND), lTable));

                location lGrinder = GetLocation(GetObjectByTag("q1a2focustableinv"));
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lGrinder);
                DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lGrinder));
                DelayCommand(0.75, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lGrinder));
                DelayCommand(0.75, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_PWSTUN), lGrinder));


                //Create the goodie
                DelayCommand(0.5, CreateSomething("nw_it_mneck035"));

                //Adjust the variables
                SetLocalInt(OBJECT_SELF, "nQuartz", GetLocalInt(OBJECT_SELF, "nQuartz") - 1);
                SetLocalInt(OBJECT_SELF, "nShadowHeart", GetLocalInt(OBJECT_SELF, "nShadowHeart") - 1);

                //Destroy Quartz
                object oToDestroy = GetItemPossessedBy(OBJECT_SELF, "NW_IT_MSMLMISC11");
                DelayCommand(0.2,DestroyObject(oToDestroy));

                //Destroy Shadow Heart
                oToDestroy = GetItemPossessedBy(OBJECT_SELF, "q1footstagtrophy");
                DelayCommand(0.2,DestroyObject(oToDestroy));
            }
        }
        //2 Fenberries and the 1 Empty bottle
        else if (GetLocalInt(OBJECT_SELF, "nFenberry") > 1 && GetLocalInt(OBJECT_SELF, "nEmptyBottles") > 0)
        {
            //Create a lesser potion of barkskin

            //Effects
            location lTable = GetLocation(GetObjectByTag("q1a2focustable"));
            DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lTable));
            DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lTable));
            DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lTable));
            DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_MIND), lTable));

            location lGrinder = GetLocation(GetObjectByTag("q1a2focustableinv"));
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lGrinder);
            DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lGrinder));
            DelayCommand(0.75, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lGrinder));
            DelayCommand(0.75, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_PWSTUN), lGrinder));


            //Create the goodie
            DelayCommand(0.5, CreateSomething("nw_it_mpotion005"));

            //Adjust the variables
            SetLocalInt(OBJECT_SELF, "nFenberry", GetLocalInt(OBJECT_SELF, "nFenberry") - 2);
            SetLocalInt(OBJECT_SELF, "nEmptyBottles", GetLocalInt(OBJECT_SELF, "nEmptyBottles") - 1);

            //Destroy Fenberries
            object oToDestroy = GetFirstItemInInventory();
            object oFenberry1;
            object oFenberry2;
            int nFenCount = 0;
            while (oToDestroy != OBJECT_INVALID && nFenCount < 2)
            {
                if (nFenCount == 0)
                {
                    if (GetTag(oToDestroy) == "NW_IT_MSMLMISC12")
                    {
                        oFenberry1 = oToDestroy;
                        nFenCount = 1;
                    }
                }
                else
                {
                    if (GetTag(oToDestroy) == "NW_IT_MSMLMISC12")
                    {
                        oFenberry2 = oToDestroy;
                        nFenCount = 2;
                    }
                }
                oToDestroy = GetNextItemInInventory();
            }

            DelayCommand(0.2,DestroyObject(oFenberry1));
            DelayCommand(0.2,DestroyObject(oFenberry2));

            //Destroy Empty Bottle
            object oBottle = GetItemPossessedBy(OBJECT_SELF, "NW_IT_THNMISC001");
            DelayCommand(0.2,DestroyObject(oBottle));
        }
        //The Practice Sword and the 1 Quartz Crystal
        else if (GetLocalInt(OBJECT_SELF, "nPracticeSword") > 0 && GetLocalInt(OBJECT_SELF, "nQuartz") > 0)
        {
            //Create the Timonen Great Sword
            if (GetLocalInt(OBJECT_SELF, "nTheTinomen") != 1)
            {
                SetLocalInt(OBJECT_SELF, "nTheTinomen", 1);
                //Effects
                location lTable = GetLocation(GetObjectByTag("q1a2focustable"));
                DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lTable));
                DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lTable));
                DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lTable));
                DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_MIND), lTable));

                location lGrinder = GetLocation(GetObjectByTag("q1a2focustableinv"));
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lGrinder);
                DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lGrinder));
                DelayCommand(0.75, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lGrinder));
                DelayCommand(0.75, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_PWSTUN), lGrinder));


                //Create the goodie
                DelayCommand(0.5, CreateSomething("x1tinomen"));

                //Adjust the variables
                SetLocalInt(OBJECT_SELF, "nPracticeSword", GetLocalInt(OBJECT_SELF, "nPracticeSword") - 1);
                SetLocalInt(OBJECT_SELF, "nQuartz", GetLocalInt(OBJECT_SELF, "nQuartz") - 1);

                //Destroy Practice Sword
                object oToDestroy = GetItemPossessedBy(OBJECT_SELF, "q1practicesword");
                DelayCommand(0.2,DestroyObject(oToDestroy));

                //Destroy Quartz
                oToDestroy = GetItemPossessedBy(OBJECT_SELF, "NW_IT_MSMLMISC11");
                DelayCommand(0.2,DestroyObject(oToDestroy));
            }
        }
    }

}
//Sets the variables on what is in the machine currently
void WhatsInMachine()
{
    int nStackSize;
    ZeroAllVariables();
    object oItem = GetFirstItemInInventory();
    while(oItem != OBJECT_INVALID)
    {
        if (GetTag(oItem) == "NW_IT_MSMLMISC11")
        {
            SetLocalInt(OBJECT_SELF, "nQuartz", GetLocalInt(OBJECT_SELF, "nQuartz") + 1);
        }
        //Aventurine
        else if (GetTag(oItem) == "NW_IT_GEM014")
        {
            nStackSize = GetNumStackedItems(oItem);

            SetLocalInt(OBJECT_SELF, "nAventurine", GetLocalInt(OBJECT_SELF, "nAventurine") + nStackSize);
            //SendMessageToPC(GetFirstPC(), "nAventurine :" + IntToString(GetLocalInt(OBJECT_SELF, "nAventurine")));
            SetLocalInt(OBJECT_SELF, "nGemTotal", GetLocalInt(OBJECT_SELF, "nGemTotal") + nStackSize);
            //SendMessageToPC(GetFirstPC(), "nGemTotal :" + IntToString(GetLocalInt(OBJECT_SELF, "nGemTotal")));
        }
        //Fluorspar
        else if (GetTag(oItem) == "NW_IT_GEM015")
        {
            nStackSize = GetNumStackedItems(oItem);
            SetLocalInt(OBJECT_SELF, "nFluorspar", GetLocalInt(OBJECT_SELF, "nFluorspar") + nStackSize);
            //SendMessageToPC(GetFirstPC(), "nFluorspar :" + IntToString(GetLocalInt(OBJECT_SELF, "nFluorspar")));
            SetLocalInt(OBJECT_SELF, "nGemTotal", GetLocalInt(OBJECT_SELF, "nGemTotal") + nStackSize);
            //SendMessageToPC(GetFirstPC(), "nGemTotal :" + IntToString(GetLocalInt(OBJECT_SELF, "nGemTotal")));
        }
        //Phenalope
        else if (GetTag(oItem) == "NW_IT_GEM004")
        {
            nStackSize = GetNumStackedItems(oItem);
            SetLocalInt(OBJECT_SELF, "nPhenalope", GetLocalInt(OBJECT_SELF, "nPhenalope") + nStackSize);
            //SendMessageToPC(GetFirstPC(), "nPhenalope :" + IntToString(GetLocalInt(OBJECT_SELF, "nPhenalope")));

            SetLocalInt(OBJECT_SELF, "nGemTotal", GetLocalInt(OBJECT_SELF, "nGemTotal") + nStackSize);
            //SendMessageToPC(GetFirstPC(), "nGemTotal :" + IntToString(GetLocalInt(OBJECT_SELF, "nGemTotal")));
        }
        //Amethyst
        else if (GetTag(oItem) == "NW_IT_GEM003")
        {
            nStackSize = GetNumStackedItems(oItem);
            SetLocalInt(OBJECT_SELF, "nAmethyst", GetLocalInt(OBJECT_SELF, "nAmethyst") + nStackSize);
            //SendMessageToPC(GetFirstPC(), "nAmethyst :" + IntToString(GetLocalInt(OBJECT_SELF, "nAmethyst")));
            SetLocalInt(OBJECT_SELF, "nGemTotal", GetLocalInt(OBJECT_SELF, "nGemTotal") + nStackSize);
            //SendMessageToPC(GetFirstPC(), "nGemTotal :" + IntToString(GetLocalInt(OBJECT_SELF, "nGemTotal")));
        }
        //a functioning focus crystal
        else if (GetTag(oItem) == "focuscrystal")
        {
            SetLocalInt(OBJECT_SELF, "nFocusCrystal", GetLocalInt(OBJECT_SELF, "nFocusCrystal") + 1);
        }
        //Green Spores
        else if (GetTag(oItem) == "q1greenspore")
        {
            SetLocalInt(OBJECT_SELF, "nGreenSpore", GetLocalInt(OBJECT_SELF, "nGreenSpore") + 1);
        }
        //Heart of the Shadow
        else if (GetTag(oItem) == "q1footstagtrophy")
        {
            SetLocalInt(OBJECT_SELF, "nShadowHeart", GetLocalInt(OBJECT_SELF, "nShadowHeart") + 1);
        }
        //Empty bottle
        else if (GetTag(oItem) == "NW_IT_THNMISC001")
        {
            SetLocalInt(OBJECT_SELF, "nEmptyBottles", GetLocalInt(OBJECT_SELF, "nEmptyBottles") + 1);
        }
        //Fenberry
        else if (GetTag(oItem) == "NW_IT_MSMLMISC12")
        {
            SetLocalInt(OBJECT_SELF, "nFenberry", GetLocalInt(OBJECT_SELF, "nFenberry") + 1);
        }
        //Practice Sword -
        else if (GetTag(oItem) == "q1practicesword")
        {
            SetLocalInt(OBJECT_SELF, "nPracticeSword", GetLocalInt(OBJECT_SELF, "nPracticeSword") + 1);
        }
        oItem = GetNextItemInInventory();
    }

}
void ZeroAllVariables()
{
    SetLocalInt(OBJECT_SELF, "nQuartz", 0);
    SetLocalInt(OBJECT_SELF, "nGemTotal", 0);
    SetLocalInt(OBJECT_SELF, "nAventurine", 0);
    SetLocalInt(OBJECT_SELF, "nFluorspar", 0);
    SetLocalInt(OBJECT_SELF, "nPhenalope", 0);
    SetLocalInt(OBJECT_SELF, "nAmethyst", 0);
    SetLocalInt(OBJECT_SELF, "nFocusCrystal", 0);
    SetLocalInt(OBJECT_SELF, "nGreenSpore", 0);
    SetLocalInt(OBJECT_SELF, "nShadowHeart", 0);
    SetLocalInt(OBJECT_SELF, "nEmptyBottles", 0);
    SetLocalInt(OBJECT_SELF, "nFenberry", 0);
    SetLocalInt(OBJECT_SELF, "nPracticeSword", 0);

}

void CreateSomething(string szThing)
{
    CreateItemOnObject(szThing);
}
