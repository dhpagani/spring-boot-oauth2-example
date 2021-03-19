import { Injectable } from '@nestjs/common';
import AbstractRepositoryRT from '../core/abstract.repository';
import { Project } from './project.entity';

@Injectable()
export class ProjectsRepository extends AbstractRepositoryRT<Project> {}
