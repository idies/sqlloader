CREATE NONCLUSTERED INDEX [i_apogeeObject_apogee_id_j_h_k_j] ON [dbo].[apogeeObject]([apogee_id] ASC, [j] ASC, [h] ASC, [k] ASC, [j_err] ASC, [h_err] ASC, [k_err] ASC) 
 
CREATE NONCLUSTERED INDEX [i_apogeeStar_apogee_id] ON [dbo].[apogeeStar]([apogee_id] ASC) 
 
CREATE NONCLUSTERED INDEX [i_apogeeStar_htmID] ON [dbo].[apogeeStar]([htmID] ASC) 
 
CREATE NONCLUSTERED INDEX [i_apogeeVisit_apogee_id] ON [dbo].[apogeeVisit]([apogee_id] ASC) 
 
CREATE NONCLUSTERED INDEX [i_apogeeVisit_plate_mjd_fiberid] ON [dbo].[apogeeVisit]([plate] ASC, [mjd] ASC, [fiberid] ASC) 
 
CREATE NONCLUSTERED INDEX [i_aspcapStar_apstar_id] ON [dbo].[aspcapStar]([apstar_id] ASC) 
 
CREATE NONCLUSTERED INDEX [i_DataConstants_value] ON [dbo].[DataConstants]([value] ASC) 
 
CREATE NONCLUSTERED INDEX [i_detectionIndex_thingID] ON [dbo].[detectionIndex]([thingId] ASC) 
 
CREATE NONCLUSTERED INDEX [i_Field_field_camcol_run_rerun] ON [dbo].[Field]([field] ASC, [camcol] ASC, [run] ASC, [rerun] ASC) 
 
CREATE NONCLUSTERED INDEX [i_Field_run_camcol_field_rerun] ON [dbo].[Field]([run] ASC, [camcol] ASC, [field] ASC, [rerun] ASC) 
 
CREATE NONCLUSTERED INDEX [i_Frame_field_camcol_run_zoom_re] ON [dbo].[Frame]([field] ASC, [camcol] ASC, [run] ASC, [zoom] ASC, [rerun] ASC) 
 
CREATE NONCLUSTERED INDEX [i_Frame_htmID_zoom_cx_cy_cz_a_b_] ON [dbo].[Frame]([htmID] ASC, [zoom] ASC, [cx] ASC, [cy] ASC, [cz] ASC, [a] ASC, [b] ASC, [c] ASC, [d] ASC, [e] ASC, [f] ASC, [node] ASC, [incl] ASC) 
 
CREATE NONCLUSTERED INDEX [i_HalfSpace_regionID_convexID_x_] ON [dbo].[HalfSpace]([regionid] ASC, [convexid] ASC, [x] ASC, [y] ASC, [z] ASC, [c] ASC) 
 
CREATE NONCLUSTERED INDEX [i_Mask_htmID_ra_dec_cx_cy_cz] ON [dbo].[Mask]([htmID] ASC, [ra] ASC, [dec] ASC, [cx] ASC, [cy] ASC, [cz] ASC) 
 
CREATE NONCLUSTERED INDEX [I_Neighbors_distance] ON [dbo].[neighbors]([distance] ASC) 
 
CREATE NONCLUSTERED INDEX [i_PhotoObjAll_field_run_rerun_ca] ON [dbo].[PhotoObjAll]([field] ASC, [run] ASC, [rerun] ASC, [camcol] ASC, [type] ASC, [mode] ASC, [flags] ASC, [rowc] ASC, [colc] ASC, [ra] ASC, [dec] ASC, [u] ASC, [g] ASC, [r] ASC, [i] ASC, [z] ASC) 
 
CREATE NONCLUSTERED INDEX [i_PhotoObjAll_fieldID_objID_ra_d] ON [dbo].[PhotoObjAll]([fieldID] ASC, [objID] ASC, [ra] ASC, [dec] ASC, [r] ASC, [type] ASC, [flags] ASC) 
 
CREATE NONCLUSTERED INDEX [i_PhotoObjAll_htmID_run_camcol_f] ON [dbo].[PhotoObjAll]([htmID] ASC, [run] ASC, [camcol] ASC, [field] ASC, [rerun] ASC, [type] ASC, [mode] ASC, [flags] ASC, [cx] ASC, [cy] ASC, [cz] ASC, [g] ASC, [r] ASC) 
 
CREATE NONCLUSTERED INDEX [i_PhotoObjAll_parentid_mode_type] ON [dbo].[PhotoObjAll]([parentID] ASC, [mode] ASC, [type] ASC) 
 
CREATE NONCLUSTERED INDEX [i_PhotoObjAll_PhotoTag] ON [dbo].[PhotoObjAll]([objID] ASC, [htmID] ASC, [fieldID] ASC, [specObjID] ASC, [run] ASC, [camcol] ASC, [ra] ASC, [dec] ASC, [cx] ASC, [cy] ASC, [cz] ASC, [flags] ASC, [mode] ASC, [type] ASC) 
 
CREATE NONCLUSTERED INDEX [i_PhotoObjAll_run_camcol_field_m] ON [dbo].[PhotoObjAll]([run] ASC, [camcol] ASC, [field] ASC, [mode] ASC, [parentID] ASC, [q_r] ASC, [q_g] ASC, [u_r] ASC, [u_g] ASC, [fiberMag_u] ASC, [fiberMag_g] ASC, [fiberMag_r] ASC, [fiberMag_i] ASC, [fiberMag_z] ASC) 
 
CREATE NONCLUSTERED INDEX [i_PhotoObjAll_run_camcol_rerun_t] ON [dbo].[PhotoObjAll]([run] ASC, [camcol] ASC, [rerun] ASC, [type] ASC, [mode] ASC, [flags] ASC, [ra] ASC, [dec] ASC, [fieldID] ASC, [field] ASC, [u] ASC, [g] ASC, [r] ASC, [i] ASC, [z] ASC) 
 
CREATE NONCLUSTERED INDEX [i_PhotoObjAll_run_camcol_type_mo] ON [dbo].[PhotoObjAll]([run] ASC, [camcol] ASC, [type] ASC, [mode] ASC, [cx] ASC, [cy] ASC, [cz] ASC) 
 
CREATE NONCLUSTERED INDEX [i_PhotoObjAll_run_mode_type_flag] ON [dbo].[PhotoObjAll]([run] ASC, [mode] ASC, [type] ASC, [flags] ASC, [u] ASC, [g] ASC, [r] ASC, [i] ASC, [z] ASC, [err_u] ASC, [err_g] ASC, [err_r] ASC, [err_i] ASC, [err_z] ASC) 
 
CREATE NONCLUSTERED INDEX [i_PhotoObjAll_SpecObjID_cx_cy_cz] ON [dbo].[PhotoObjAll]([specObjID] ASC, [cx] ASC, [cy] ASC, [cz] ASC, [mode] ASC, [type] ASC, [flags] ASC, [ra] ASC, [dec] ASC, [u] ASC, [g] ASC, [r] ASC, [i] ASC, [z] ASC) 
 
CREATE NONCLUSTERED INDEX [i_PhotoObjDR7_dr7objID] ON [dbo].[PhotoObjDR7]([dr7objid] ASC) 
 
CREATE NONCLUSTERED INDEX [i_PlateX_htmID_ra_dec_cx_cy_cz] ON [dbo].[PlateX]([htmID] ASC, [ra] ASC, [dec] ASC, [cx] ASC, [cy] ASC, [cz] ASC) 
 
CREATE NONCLUSTERED INDEX [i_RegionPatch_htmID_ra_dec_x_y_z] ON [dbo].[RegionPatch]([htmid] ASC, [ra] ASC, [dec] ASC, [x] ASC, [y] ASC, [z] ASC, [type] ASC) 
 
CREATE NONCLUSTERED INDEX [i_sdssTileAll_htmID_racen_deccen] ON [dbo].[sdssTileAll]([htmID] ASC, [raCen] ASC, [decCen] ASC, [cx] ASC, [cy] ASC, [cz] ASC) 
 
CREATE UNIQUE NONCLUSTERED INDEX [i_sdssTileAll_tileRun_tile] ON [dbo].[sdssTileAll]([tileRun] ASC, [tile] ASC) 
 
CREATE NONCLUSTERED INDEX [i_sdssTiledTargetAll_htmID_ra_de] ON [dbo].[sdssTiledTargetAll]([htmID] ASC, [ra] ASC, [dec] ASC, [cx] ASC, [cy] ASC, [cz] ASC) 
 
CREATE UNIQUE NONCLUSTERED INDEX [i_sdssTilingInfo_targetID_tileRu] ON [dbo].[sdssTilingInfo]([targetID] ASC, [tileRun] ASC, [collisionGroup] ASC) 
 
CREATE NONCLUSTERED INDEX [i_sdssTilingInfo_tile_collisionG] ON [dbo].[sdssTilingInfo]([tile] ASC, [collisionGroup] ASC) 
 
CREATE UNIQUE NONCLUSTERED INDEX [i_sdssTilingInfo_tileRun_tid_col] ON [dbo].[sdssTilingInfo]([tileRun] ASC, [tid] ASC, [collisionGroup] ASC) 
 
CREATE NONCLUSTERED INDEX [i_segueTargetAll_segue1_target1_] ON [dbo].[segueTargetAll]([segue1_target1] ASC, [segue2_target1] ASC) 
 
CREATE NONCLUSTERED INDEX [i_SpecObjAll_BestObjID_sourceTyp] ON [dbo].[SpecObjAll]([bestObjID] ASC, [sourceType] ASC, [sciencePrimary] ASC, [class] ASC, [htmID] ASC, [ra] ASC, [dec] ASC, [plate] ASC, [mjd] ASC, [fiberID] ASC, [z] ASC, [zErr] ASC) 
 
CREATE NONCLUSTERED INDEX [i_SpecObjAll_class_zWarning_z_sc] ON [dbo].[SpecObjAll]([class] ASC, [zWarning] ASC, [z] ASC, [sciencePrimary] ASC, [plateID] ASC, [bestObjID] ASC, [targetObjID] ASC, [htmID] ASC, [ra] ASC, [dec] ASC) 
 
CREATE NONCLUSTERED INDEX [i_SpecObjAll_fluxObjID] ON [dbo].[SpecObjAll]([fluxObjID] ASC) 
 
CREATE NONCLUSTERED INDEX [i_SpecObjAll_htmID_ra_dec_cx_cy_] ON [dbo].[SpecObjAll]([htmID] ASC, [ra] ASC, [dec] ASC, [cx] ASC, [cy] ASC, [cz] ASC, [sciencePrimary] ASC) 
 
CREATE NONCLUSTERED INDEX [i_SpecObjAll_ra_dec_class_plat] ON [dbo].[SpecObjAll]([ra] ASC, [dec] ASC, [class] ASC, [plate] ASC, [tile] ASC, [z] ASC, [zErr] ASC, [sciencePrimary] ASC, [plateID] ASC, [bestObjID] ASC) 
 
CREATE NONCLUSTERED INDEX [i_SpecObjAll_targetObjID_sourceT] ON [dbo].[SpecObjAll]([targetObjID] ASC, [sourceType] ASC, [sciencePrimary] ASC, [class] ASC, [htmID] ASC, [ra] ASC, [dec] ASC) 
 
CREATE NONCLUSTERED INDEX [i_SpecPhotoAll_objID_sciencePrim] ON [dbo].[SpecPhotoAll]([objID] ASC, [sciencePrimary] ASC, [class] ASC, [z] ASC, [targetObjID] ASC) 
 
CREATE NONCLUSTERED INDEX [i_SpecPhotoAll_targetObjID_scien] ON [dbo].[SpecPhotoAll]([targetObjID] ASC, [sciencePrimary] ASC, [class] ASC, [z] ASC, [objID] ASC) 
 
CREATE NONCLUSTERED INDEX [i_thingIndex_objID] ON [dbo].[thingIndex]([objID] ASC) 
 
CREATE NONCLUSTERED INDEX [i_TwoMass_ccflag] ON [dbo].[TwoMass]([ccFlag] ASC) 
 
CREATE NONCLUSTERED INDEX [i_TwoMass_dec] ON [dbo].[TwoMass]([dec] ASC) 
 
CREATE NONCLUSTERED INDEX [i_TwoMass_h] ON [dbo].[TwoMass]([h] ASC) 
 
CREATE NONCLUSTERED INDEX [i_TwoMass_j] ON [dbo].[TwoMass]([j] ASC) 
 
CREATE NONCLUSTERED INDEX [i_TwoMass_k] ON [dbo].[TwoMass]([k] ASC) 
 
CREATE NONCLUSTERED INDEX [i_TwoMass_phqual] ON [dbo].[TwoMass]([phQual] ASC) 
 
CREATE NONCLUSTERED INDEX [i_TwoMass_ra] ON [dbo].[TwoMass]([ra] ASC) 
 
CREATE NONCLUSTERED INDEX [i_WISE_allsky_blend_ext_flags] ON [dbo].[WISE_allsky]([blend_ext_flags] ASC) 
 
CREATE NONCLUSTERED INDEX [i_WISE_allsky_glat_glon] ON [dbo].[WISE_allsky]([glat] ASC, [glon] ASC) 
 
CREATE NONCLUSTERED INDEX [i_WISE_allsky_h_m_2mass] ON [dbo].[WISE_allsky]([h_m_2mass] ASC) 
 
CREATE NONCLUSTERED INDEX [i_WISE_allsky_j_m_2mass] ON [dbo].[WISE_allsky]([j_m_2mass] ASC) 
 
CREATE NONCLUSTERED INDEX [i_WISE_allsky_k_m_2mass] ON [dbo].[WISE_allsky]([k_m_2mass] ASC) 
 
CREATE NONCLUSTERED INDEX [i_WISE_allsky_n_2mass] ON [dbo].[WISE_allsky]([n_2mass] ASC) 
 
CREATE NONCLUSTERED INDEX [i_WISE_allsky_ra_dec] ON [dbo].[WISE_allsky]([ra] ASC, [dec] ASC) 
 
CREATE NONCLUSTERED INDEX [i_WISE_allsky_rjce] ON [dbo].[WISE_allsky]([rjce] ASC) 
 
CREATE NONCLUSTERED INDEX [i_WISE_allsky_tmass_key] ON [dbo].[WISE_allsky]([tmass_key] ASC) 
 
CREATE NONCLUSTERED INDEX [i_WISE_allsky_w1cc_map] ON [dbo].[WISE_allsky]([w1cc_map] ASC) 
 
CREATE NONCLUSTERED INDEX [i_WISE_allsky_w1mpro] ON [dbo].[WISE_allsky]([w1mpro] ASC) 
 
CREATE NONCLUSTERED INDEX [i_WISE_allsky_w1rsemi] ON [dbo].[WISE_allsky]([w1rsemi] ASC) 
 
CREATE NONCLUSTERED INDEX [i_WISE_allsky_w2cc_map] ON [dbo].[WISE_allsky]([w2cc_map] ASC) 
 
CREATE NONCLUSTERED INDEX [i_WISE_allsky_w2mpro] ON [dbo].[WISE_allsky]([w2mpro] ASC) 
 
CREATE NONCLUSTERED INDEX [i_WISE_allsky_w3cc_map] ON [dbo].[WISE_allsky]([w3cc_map] ASC) 
 
CREATE NONCLUSTERED INDEX [i_WISE_allsky_w3mpro] ON [dbo].[WISE_allsky]([w3mpro] ASC) 
 
CREATE NONCLUSTERED INDEX [i_WISE_allsky_w4cc_map] ON [dbo].[WISE_allsky]([w4cc_map] ASC) 
 
CREATE NONCLUSTERED INDEX [i_WISE_allsky_w4mpro] ON [dbo].[WISE_allsky]([w4mpro] ASC) 
 
CREATE NONCLUSTERED INDEX [i_WISE_xmatch_wise_cntr] ON [dbo].[WISE_xmatch]([wise_cntr] ASC) 
 
CREATE NONCLUSTERED INDEX [i_wiseForcedTarget_ra_dec_has_wi] ON [dbo].[wiseForcedTarget]([ra] ASC, [dec] ASC, [has_wise_phot] ASC, [treated_as_pointsource] ASC) 
 
CREATE NONCLUSTERED INDEX [i_zooConfidence_objID] ON [dbo].[zooConfidence]([objid] ASC) 
 
CREATE NONCLUSTERED INDEX [i_zooMirrorBias_objID] ON [dbo].[zooMirrorBias]([objid] ASC) 
 
CREATE NONCLUSTERED INDEX [i_zooMonochromeBias_objID] ON [dbo].[zooMonochromeBias]([objid] ASC) 
 
CREATE NONCLUSTERED INDEX [i_zooNoSpec_objID] ON [dbo].[zooNoSpec]([objid] ASC) 
 
CREATE NONCLUSTERED INDEX [i_zooSpec_objID] ON [dbo].[zooSpec]([objid] ASC) 
 
CREATE NONCLUSTERED INDEX [i_zooVotes_objID] ON [dbo].[zooVotes]([objid] ASC) 
 