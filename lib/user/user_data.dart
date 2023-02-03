import 'dart:convert';

import 'package:flutter/material.dart';

import 'user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

  static User myUser = User(
    image:"https://lh3.googleusercontent.com/wImYbriUKUERNbM31kJ9EAwbF-LtjiqvwmXirBOp3O0l99cTR_D55YgkdAWWW632otct23lrXCA9rqIM98HxoEZWX-24zbq09ZaokDPITg9P8gIjR-6TT2EzKTVB1JSk60ovLkvULRJ2leHrbP8wrCZzZZnr9BpwlHiC_IHfS_oREmfrn0YhiwHUd8fql57A7Uce4N9tJWcQOvvpGj-adjDVK5p6maX882ztHUJsE4enQqUyPdgHVC7xoTMJOFoNR15QMc2X-kAQSvg1PAg36PPJOw-eu00toRWIY_mcTt9FF-8YpXyhjUVP-TLjrGUmNgSkJUMel5kvpx0aBKVhzC8r9ZGDjQjApXPmeU-tI0K5sab11coA7VBo43gTolax8BdqL-VI63-osFaVThnNKJJZ-PCU8oHMQBA_sJPudEgr3B6Tb1TxUMSZCPxGyZJvxMBnb14T2mmzBgq263T-o9til4Ohvt5a1KOj_8ccL_7sqOwzX10QG6plbe6YGPnAwBsHq0f3VEuaNkVM-llh4NE_J64aq-IqxISVptIaRngv6yUA5u8piyTKH9xrkADqxG8o17Ri9XqHWdSYi3_S3fhTOpXu5YYIXYrKYJ_6agtprCP9ca2GWswbeHFSKy0HLW3ZC1kra-7GUL6e1YdtViXkvAmtUp17RtlJXMrcV2K-9Jj-a9Ed7L3LQ6cTRA01b_DDSyxjCc1FjqlZ2IT5pWc-WDaLFQ7DFSInCag6R3AUbcrq2rZxB1vIapVMoB_sq4DovfFfqbqSiaP6pJzcdKVpW3UouWK7B7IODAvoJdM08eRCeBxXfPClRUtRCPYf2xoxO40LwEqTnJrIUixC7oIrR_0oz1B8XjtHALnkBO4q4sbdLCuhkCpG70DhHdpVk24oSW93k30t-uxvhfETljgKm77x2rBZgsE1QFo2Ac8lj92rKNCLhYDIAtQc5HOXT6GfqJz5BPq7YrfofFw6jiWHP4_Rv0wtB5YpIMqoGOOgLfEvxxpS8mxvLDbtEdZRnUeZ7O6ciZGq3UBstPL31i4=w1474-h1966-no?authuser=0",
    name: 'Katherine Hua',
    email: 'katherinehua06@gmail.com',
    phone: '949-357-8835',
    aboutMeDescription:
        'AUesome! ',
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
