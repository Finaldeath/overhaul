// KEEP THIS!

void main()
{
    int MAX_NUMB = 1;
    int j = GetLocalInt(OBJECT_SELF, "nTreasureHelp");
    int i = j;
    string s0 = GetLocalString(OBJECT_SELF, "sTreasureHelp");
    string s1;
    string s2;
    string sTag;
    string sName;
    object o;



    switch (i)
    {
        case 0:
            s0 = "it_arm_";
            s1 = "cloth_";
            break;

        case 1:
            s1 = "heavy_";
            break;

        case 2:
            s1 = "helm_";
            break;

        case 3:
            s1 = "light_";
            break;

        case 4:
            s1 = "med_";
            break;

        case 5:
            s1 = "npc_";
            break;

        case 6:
            s1 = "lsh_";
            break;

        case 7:
            s1 = "ssh_";
            break;

        case 8:
            s1 = "tsh_";
            break;

        case 9:
            s0 = "it_misc_";
            s1 = "book_";
            break;

        case 10:
            s1 = "belt_";
            break;

        case 11:
            s1 = "boot_";
            break;

        case 12:
            s1 = "brac_";
            break;

        case 13:
            s1 = "cloa_";
            break;

        case 14:
            s1 = "gaun_";
            break;

        case 15:
            s1 = "gem_";
            break;

        case 16:
            s1 = "amul_";
            break;

        case 17:
            s1 = "ring_";
            break;

        case 18:
            s1 = "cnt_";
            break;

        case 19:
            s1 = "gold_";
            break;

        case 20:
            s1 = "key_";
            break;

        case 21:
            s1 = "lrg_";
            break;

        case 22:
            s1 = "med_";
            break;

        case 23:
            s1 = "sml_";
            break;

        case 24:
            s1 = "thn_";
            break;

        case 25:
            s1 = "torc_";
            break;

        case 26:
            s1 = "trap_";
            break;

        case 27:
            s1 = "poti_";
            break;

        case 28:
            s1 = "scro_";
            break;

        case 29:
            s0 = "it_weap_";
            s1 = "arro_";
            break;

        case 30:
            s1 = "bolt_";
            break;

        case 31:
            s1 = "bull_";
            break;

        case 32:
            s1 = "gaxe_";
            break;

        case 33:
            s1 = "baxe_";
            break;

        case 34:
            s1 = "haxe_";
            break;

        case 35:
            s1 = "bswo_";
            break;

        case 36:
            s1 = "dagg_";
            break;

        case 37:
            s1 = "gswo_";
            break;

        case 38:
            s1 = "lswo_";
            break;

        case 39:
            s1 = "kata_";
            break;

        case 40:
            s1 = "rapi_";
            break;

        case 41:
            s1 = "scim_";
            break;

        case 42:
            s1 = "sswo_";
            break;

        case 43:
            s1 = "club_";
            break;

        case 44:
            s1 = "hfla_";
            break;

        case 45:
            s1 = "lfla_";
            break;

        case 46:
            s1 = "lham_";
            break;

        case 47:
            s1 = "wham_";
            break;

        case 48:
            s1 = "mace_";
            break;

        case 49:
            s1 = "morn_";
            break;

        case 50:
            s1 = "daxe_";
            break;

        case 51:
            s1 = "dmac_";
            break;

        case 52:
            s1 = "quar_";
            break;

        case 53:
            s1 = "tbsw_";
            break;

        case 54:
            s1 = "kama_";
            break;

        case 55:
            s1 = "kukr_";
            break;

        case 56:
            s1 = "sick_";
            break;

        case 57:
            s1 = "mrod_";
            break;

        case 58:
            s1 = "msta_";
            break;

        case 59:
            s1 = "mwan_";
            break;

        case 60:
            s1 = "halb_";
            break;

        case 61:
            s1 = "scyt_";
            break;

        case 62:
            s1 = "spea_";
            break;

        case 63:
            s1 = "hcro_";
            break;

        case 64:
            s1 = "lcro_";
            break;

        case 65:
            s1 = "lbow_";
            break;

        case 66:
            s1 = "sbow_";
            break;

        case 67:
            s1 = "slin_";
            break;

        case 68:
            s1 = "dart_";
            break;

        case 69:
            s1 = "shur_";
            break;

        case 70:
            s1 = "taxe_";
            break;
    }

    for (i = 0; i < 5; i++)
    {
        s2 = s0 + s1 + "0" + IntToString(i) + "0";

        o = CreateItemOnObject(s2);

        if (GetStringUpperCase(s2) != GetTag(o) || GetStringUpperCase(s2) != GetName(o))
            AssignCommand(OBJECT_SELF, SpeakString(s2 + "  *** Problem with *** " + s2));

        else
            AssignCommand(OBJECT_SELF, SpeakString(s2 + "  Worked out fine: " + s2));

        DestroyObject(o);
    }

    j++;
    SetLocalInt(OBJECT_SELF, "nTreasureHelp", j);
    SetLocalString(OBJECT_SELF, "sTreasureHelp", s0);
}
